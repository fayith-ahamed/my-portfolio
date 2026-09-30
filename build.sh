#!/bin/bash
set -e

echo "=== Downloading Flutter SDK ==="
git clone https://github.com/flutter/flutter.git -b stable --depth 1 _flutter

export PATH="$PATH:`pwd`/_flutter/bin"

echo "=== Getting Flutter Dependencies ==="
flutter pub get

echo "=== Building Flutter Web Release ==="
flutter build web --release

echo "=== Build Complete ==="
