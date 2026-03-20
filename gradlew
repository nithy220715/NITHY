#!/usr/bin/env sh
DIR="$(cd "$(dirname "$0")" && pwd)"
java -version >/dev/null 2>&1 || { echo "Java is required"; exit 1; }
exec sh "$DIR/gradle/wrapper/gradle-wrapper.sh" "$@"
