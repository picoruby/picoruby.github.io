/* version-selector.js -- PicoRuby WASM version selector bar (shared) */
(function () {
  'use strict';

  /* Maintain this list manually when new versions are released. */
  /* Only 4.0 or later is supported; 3.x is not. */
  var VERSIONS = ['head', 'latest', '4.0.3', '4.0.2', '4.0.1', '4.0.0'];

  var NPM_PACKAGE = '@picoruby/wasm-wasi';
  var CDN_BASE    = 'https://cdn.jsdelivr.net/npm/';
  var CDN_PATH    = '/dist/init.iife.js';

  function getRequestedVersion() {
    var params = new URLSearchParams(window.location.search);
    return params.get('picoruby_version') || 'latest';
  }

  function isSupportedVersion(v) {
    if (v === 'head' || v === 'latest') return true;
    /* Strict format check; also keeps URL-supplied values safe for innerHTML. */
    var m = /^(\d+)\.\d+\.\d+(-[0-9A-Za-z.]+)?$/.exec(v);
    return !!m && 4 <= parseInt(m[1], 10);
  }

  function buildSelectHTML(requested) {
    var versions = VERSIONS.slice();
    if (versions.indexOf(requested) === -1) {
      versions.push(requested);
    }
    return versions.map(function (v) {
      var label = v === 'latest' ? 'Latest' : v === 'head' ? 'head' : v;
      var sel   = v === requested ? ' selected' : '';
      return '<option value="' + v + '"' + sel + '>' + label + '</option>';
    }).join('');
  }

  function resolveVersion(requested, callback) {
    if (requested !== 'latest') {
      callback(requested);
      return;
    }
    fetch('https://registry.npmjs.org/' + NPM_PACKAGE + '/latest')
      .then(function (r) { return r.json(); })
      .then(function (d) { callback(d.version); })
      .catch(function ()  {
        var fallback = VERSIONS.filter(function (v) { return v !== 'latest' && v !== 'head'; })[0];
        callback(fallback);
      });
  }

  function pollRubyDescription() {
    var attempts = 0;
    var timer = setInterval(function () {
      attempts++;
      var desc = window.__ruby_description;
      if (desc) {
        var el = document.getElementById('ruby-description');
        if (el) el.textContent = String(desc);
        clearInterval(timer);
      } else if (attempts >= 100) {
        clearInterval(timer);
      }
    }, 200);
  }

  function loadWasmScript(version) {
    var descEl = document.getElementById('ruby-description');
    if (descEl) descEl.textContent = 'v' + version + ' loading...';

    var script  = document.createElement('script');
    script.src  = CDN_BASE + NPM_PACKAGE + '@' + version + CDN_PATH;
    document.body.appendChild(script);
    pollRubyDescription();
  }

  function init() {
    var bar = document.getElementById('version-bar');
    if (!bar) return;

    var requested = getRequestedVersion();
    var unsupportedNote = '';
    if (!isSupportedVersion(requested)) {
      unsupportedNote =
        '<span style="font-size:12px;color:#c00;margin-left:4px;">' +
        'The requested version is not supported (4.0 or later required); using Latest.' +
        '</span>';
      requested = 'latest';
    }

    bar.className = 'controls';
    bar.innerHTML =
      '<label>Select closest version number to your R2P2: <select id="picoruby-version-select">' +
      buildSelectHTML(requested) +
      '</select></label>' +
      unsupportedNote +
      '<span id="ruby-description"' +
      ' style="font-family:monospace;font-size:12px;color:#888;margin-left:4px;">' +
      '</span>';

    document.getElementById('picoruby-version-select').addEventListener('change', function () {
      window.location.href =
        window.location.pathname + '?picoruby_version=' + encodeURIComponent(this.value);
    });

    resolveVersion(requested, loadWasmScript);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
