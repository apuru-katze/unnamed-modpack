PACKWIZ_TMP="$(mktemp -d)" &&
curl -fsSL "https://nightly.link/packwiz/packwiz/workflows/go/main/Linux%2064-bit%20x86.zip" -o "$PACKWIZ_TMP/packwiz.zip" &&
unzip -q "$PACKWIZ_TMP/packwiz.zip" -d "$PACKWIZ_TMP" &&
chmod +x "$PACKWIZ_TMP/packwiz" &&
rm -rf public &&
mkdir -p public &&
cp -r pack/. public/ &&
(cd public && "$PACKWIZ_TMP/packwiz" refresh --build) &&
(cd archive && zip -r ../public/modpack.zip .)
