#!/bin/sh

# generate files
flutter build web

# create docs if doesn't exists
mkdir -p docs

# copy files into docs
cp -av build/web/* docs/
cp -v media/favicon.ico docs/

# clean up
rm -f docs/assets/LICENSE
rm -f docs/main.dart.js.deps
rm -f docs/main.dart.js.map