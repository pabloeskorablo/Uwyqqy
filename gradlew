#!/bin/sh
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
JAR="$APP_HOME/gradle/wrapper/gradle-wrapper.jar"
if [ ! -f "$JAR" ]; then
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL -o "$JAR" "https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar" || rm -f "$JAR"
  elif command -v wget >/dev/null 2>&1; then
    wget -q -O "$JAR" "https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar" || rm -f "$JAR"
  fi
fi
if [ ! -f "$JAR" ]; then
  echo "Gradle wrapper JAR missing. Open the project in AndroidIDE and let it sync, or install curl/wget." >&2
  exit 1
fi
exec java ${JAVA_OPTS:-} ${GRADLE_OPTS:-} -classpath "$JAR" org.gradle.wrapper.GradleWrapperMain "$@"
