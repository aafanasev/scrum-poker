#!/bin/sh

find test -type f -name "*_test.dart" -print0 | xargs -0 flutter test