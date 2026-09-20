@ECHO OFF
SET APP_HOME=%~dp0
SET JAR=%APP_HOME%gradle\wrapper\gradle-wrapper.jar
IF NOT EXIST "%JAR%" (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/gradle/gradle/v8.13.0/gradle/wrapper/gradle-wrapper.jar' -OutFile '%JAR%'"
)
IF NOT EXIST "%JAR%" EXIT /B 1
java %JAVA_OPTS% %GRADLE_OPTS% -classpath "%JAR%" org.gradle.wrapper.GradleWrapperMain %*
