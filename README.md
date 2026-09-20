# LAYER

Нативное Android-приложение local-first: локальный анализ accessibility-экрана, allowlist, сейф-режим, локальный зашифрованный vault, Quick Settings kill switch.

## Сборка

Основные файлы проекта находятся в корне ZIP:

- settings.gradle
- build.gradle
- gradle.properties
- app/
- code2native.json

Команда релизной сборки:

    ./gradlew --no-daemon :app:assembleDebug

Требования toolchain: Android Gradle Plugin 8.7.3, Gradle 8.9, JDK 17.

## Безопасность

Приложение намеренно не запрашивает INTERNET permission. Чтение accessibility-дерева происходит только после явного нажатия L и после проверки политики доступа.
