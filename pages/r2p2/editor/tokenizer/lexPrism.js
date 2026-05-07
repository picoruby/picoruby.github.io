// Convert Prism's serialized lex output into an editor token array.
export function lexPrism(prism, source) {
  const sourceBytes = new TextEncoder().encode(source);
  const sourceBufferPointer = prism.calloc(1, sourceBytes.length);
  const lexOutputBufferPointer = prism.calloc(prism.pm_buffer_sizeof(), 1);

  prism.pm_buffer_init(lexOutputBufferPointer);

  new Uint8Array(
    prism.memory.buffer,
    sourceBufferPointer,
    sourceBytes.length
  ).set(sourceBytes);

  prism.pm_serialize_lex(
    lexOutputBufferPointer,
    sourceBufferPointer,
    sourceBytes.length,
    0 // options
  );

  const serializedLexBytes = new Uint8Array(
    prism.memory.buffer,
    prism.pm_buffer_value(lexOutputBufferPointer),
    prism.pm_buffer_length(lexOutputBufferPointer)
  ).slice();

  prism.pm_buffer_free(lexOutputBufferPointer);
  prism.free(sourceBufferPointer);
  prism.free(lexOutputBufferPointer);

  return deserializeLex(prism, serializedLexBytes);
}

function deserializeLex(prism, serializedLexBytes) {
  const tokens = [];
  const readToken = createSerializedLexReader(serializedLexBytes);
  const internTokenTypeName = createTokenTypeNameInterner(prism);

  for (let readCount = 0; readCount < serializedLexBytes.length; readCount++) {
    const token = readToken();
    if (token === null) break;

    tokens.push({
      type: internTokenTypeName(token.type),
      startOffset: token.startOffset,
      length: token.length,
    });
  }

  return tokens;
}

function createSerializedLexReader(serializedLexBytes) {
  const CONTINUATION_BIT_MASK = 0x80;
  const VALUE_MASK = 0x7f;
  const END_OF_TOKENS = 0;
  let pos = 0;

  return function readToken() {
    // pm_serialize_lex outputs each token as LEB128 varints in token_type, start_offset, length, lex_state order.
    const tokenTypeOrEndMarker = readVarUint();
    if (tokenTypeOrEndMarker === END_OF_TOKENS) return null;

    const type = tokenTypeOrEndMarker;
    const startOffset = readVarUint();
    const length = readVarUint();

    // Discard lex_state because it is not used.
    readVarUint();

    return { type, startOffset, length };
  };

  function readVarUint() {
    let decodedValue = 0;
    let shift = 0;

    while (pos < serializedLexBytes.length) {
      const byte = serializedLexBytes[pos++];
      decodedValue |= (byte & VALUE_MASK) << shift;

      if ((byte & CONTINUATION_BIT_MASK) === 0) break;

      shift += 7;
    }

    return decodedValue;
  }
}

function createTokenTypeNameInterner(prism) {
  const cache = new Map();
  const prismMemory = new Uint8Array(prism.memory.buffer);

  return function internTokenTypeName(type) {
    const cachedName = cache.get(type);

    if (cachedName !== undefined) {
      return cachedName;
    }

    const name = readPrismTokenTypeName(type);
    cache.set(type, name);

    return name;
  };

  function readPrismTokenTypeName(type) {
    const stringPointer = prism.pm_token_type_name(type);
    const end = prismMemory.indexOf(0, stringPointer);

    return new TextDecoder().decode(prismMemory.subarray(stringPointer, end));
  }
}
