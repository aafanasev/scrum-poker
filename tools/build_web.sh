#!/bin/sh

# generate files
flutter build web

# create docs if doesn't exists
mkdir -p docs

# copy files into docs
cp -a build/web/ docs/
cp media/favicon.ico docs/

# clean up
rm -f docs/assets/LICENSE
rm -f docs/main.dart.js.deps
rm -f docs/main.dart.js.map