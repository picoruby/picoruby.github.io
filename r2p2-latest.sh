#!/bin/sh

# Fetch the latest release and extract .gz asset URLs
urls=$(curl -s https://api.github.com/repos/picoruby/R2P2/releases/latest |
  grep '"browser_download_url"' |
  sed -E 's/.*"browser_download_url": "(.*)".*/\1/' |
  grep '\.gz$')

# List URLs and prompt user
i=1
for u in $urls; do
  echo "[$i] $u"
  eval "url$i=\"$u\""
  i=$((i+1))
done

printf "Enter the number to download: "
read n

eval "url=\$url$n"

if [ -z "$url" ]; then
  echo "Invalid selection" >&2
  exit 1
fi

# Derive output filename (remove .gz)
outfile=$(basename "$url" .gz)

echo "Downloading and decompressing: $outfile ..."
curl -L -s "$url" | gzip -d > "$outfile" || exit 1

echo "Done: $outfile"

