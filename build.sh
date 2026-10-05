#!/usr/bin/env bash

set -e

PACKWIZ_TMP="$(mktemp -d)"
if ! curl -fsSL \
	"https://nightly.link/packwiz/packwiz/workflows/go/main/Linux%2064-bit%20x86.zip" \
	-o "$PACKWIZ_TMP/packwiz.zip"; then
	echo "Latest Packwiz artifact unavailable, using fallback run 34043101039..."

	curl -fsSL \
		"https://nightly.link/packwiz/packwiz/actions/runs/34043101039/Linux%2064-bit%20x86.zip" \
		-o "$PACKWIZ_TMP/packwiz.zip"
fi

unzip -q "$PACKWIZ_TMP/packwiz.zip" -d "$PACKWIZ_TMP"
chmod +x "$PACKWIZ_TMP/packwiz"

rm -rf public
mkdir -p public
cp -r pack/. public/

(cd public && "$PACKWIZ_TMP/packwiz" refresh --build)
(cd archive && zip -r ../public/modpack.zip .)
