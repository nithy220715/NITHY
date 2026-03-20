#!/usr/bin/env sh
# Simplified wrapper to download and run Gradle
APP_HOME=$(cd "$(dirname "$0")/../.." && pwd)
WRAPPER_JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
PROPS="$APP_HOME/gradle/wrapper/gradle-wrapper.properties"

GRADLE_DIST_URL=$(grep distributionUrl "$PROPS" | cut -d= -f2)
DIST_DIR="$HOME/.gradle/wrapper/dists"
mkdir -p "$DIST_DIR"
ZIP_NAME=$(basename "$GRADLE_DIST_URL")
ZIP_PATH="$DIST_DIR/$ZIP_NAME"
if [ ! -f "$ZIP_PATH" ]; then
  echo "Downloading $GRADLE_DIST_URL"
  curl -L "$GRADLE_DIST_URL" -o "$ZIP_PATH"
fi
UNZIP_DIR="$DIST_DIR/${ZIP_NAME%.zip}"
if [ ! -d "$UNZIP_DIR" ]; then
  unzip -q "$ZIP_PATH" -d "$DIST_DIR"
fi
GRADLE_BIN=$(find "$DIST_DIR" -type f -path "*/bin/gradle" | head -n 1)
exec "$GRADLE_BIN" "$@"
