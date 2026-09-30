#!/bin/bash
set -e

FLUTTER_VERSION="3.24.5"

echo "=== Downloading Flutter SDK ${FLUTTER_VERSION} ==="
git clone https://github.com/flutter/flutter.git \
  -b "${FLUTTER_VERSION}" \
  --depth 1 \
  _flutter

export PATH="$(pwd)/_flutter/bin:$PATH"

echo "=== Flutter Version ==="
flutter --version

echo "=== Getting Flutter Dependencies ==="
flutter pub get

echo "=== Building Flutter Web Release ==="
flutter build web --release

echo "=== Build Complete ==="