# Quizfire — TMS Quiz

Мобильное Flutter-приложение для прохождения тематических викторин. Пользователь может создать аккаунт, войти в приложение, выбрать викторину и отвечать на вопросы с отображением текущего прогресса.

Проект находится в разработке.

## Возможности

- регистрация пользователя по email и паролю;
- авторизация и выход из аккаунта через Firebase Authentication;
- защита экранов для неавторизованных пользователей;
- загрузка списка викторин из Cloud Firestore;
- выбор викторины из общего списка;
- последовательное прохождение вопросов;
- выбор одного варианта ответа;
- анимированный индикатор прогресса;
- подсчёт правильных ответов в модели результата.

## Технологии

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Firebase Authentication](https://firebase.google.com/docs/auth)
- [Cloud Firestore](https://firebase.google.com/docs/firestore)
- [AutoRoute](https://pub.dev/packages/auto_route)
- `ChangeNotifier` и `InheritedNotifier` для управления состоянием
- `build_runner` для генерации маршрутов

## Экраны приложения

- приветственный экран;
- вход в аккаунт;
- регистрация;
- список викторин;
- экран прохождения викторины;
- экран результата — в разработке.

## Структура проекта

```text
lib/
├── main.dart
├── firebase_options.dart
└── src/
    ├── app.dart
    ├── core/
    │   ├── constants/
    │   ├── routing/
    │   └── widgets/
    ├── quiz/
    │   ├── models/
    │   ├── screens/
    │   ├── state/
    │   └── widgets/
    └── user/
        ├── screen/
        └── state/
```

## Требования

Перед запуском необходимо установить:

- Flutter SDK;
- Dart SDK `>= 3.9.2`;
- Android Studio или VS Code с расширениями Flutter и Dart;
- настроенный эмулятор либо подключённое устройство;
- Firebase CLI и FlutterFire CLI — для подключения собственного Firebase-проекта.

Проверить установленное окружение:

```bash
flutter doctor
```

## Установка

Клонируйте репозиторий:

```bash
git clone https://github.com/jtahun/tms_quiz.git
cd tms_quiz
```

Установите зависимости:

```bash
flutter pub get
```

## Настройка Firebase

1. Создайте проект в Firebase Console.
2. В разделе **Authentication** включите способ входа **Email/Password**.
3. Создайте базу данных **Cloud Firestore**.
4. Установите FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
```

5. Свяжите приложение со своим Firebase-проектом:

```bash
flutterfire configure
```

Команда создаст или обновит файл:

```text
lib/firebase_options.dart
```

> Не добавляйте в публичный репозиторий сервисные аккаунты, приватные ключи, файлы подписи Android и другие секреты.

## Структура данных Firestore

Приложение загружает викторины из коллекции:

```text
quizzes
```

Пример документа:

```json
{
  "id": 1,
  "title": "Физика",
  "questions": [
    {
      "title": "В каких единицах измеряется сила в системе СИ?",
      "answers": [
        {
          "title": "Ньютонах",
          "isCorrect": true
        },
        {
          "title": "Джоулях",
          "isCorrect": false
        }
      ]
    }
  ]
}
```

## Генерация маршрутов

После изменения маршрутов или аннотаций `@RoutePage()` выполните:

```bash
dart run build_runner build --delete-conflicting-outputs
```

Для автоматической генерации во время разработки:

```bash
dart run build_runner watch --delete-conflicting-outputs
```

## Запуск

Запуск на выбранном устройстве:

```bash
flutter run
```

Посмотреть доступные устройства:

```bash
flutter devices
```

Запуск на конкретном устройстве:

```bash
flutter run -d <device-id>
```

## Проверка проекта

Статический анализ:

```bash
flutter analyze
```

Запуск тестов:

```bash
flutter test
```

Форматирование кода:

```bash
dart format lib test
```

## Сборка

Android APK:

```bash
flutter build apk --release
```

Android App Bundle:

```bash
flutter build appbundle --release
```

Web:

```bash
flutter build web
```

## Планы развития

- завершить экран результата викторины;
- сохранять результаты пользователей в Firestore;
- добавить проверку подтверждения пароля при регистрации;
- добавить состояния загрузки и обработку пустого списка викторин;
- добавить повторное прохождение викторины;
- расширить покрытие тестами;
- добавить возможность создания собственных викторин.

## Дизайн

Визуальный прототип приложения:

[Figma — Quiz app](https://www.figma.com/design/CGFdo4BBMJaVWRJrkNpv0m/Quiz-app?node-id=0-1&p=f)

## Автор

GitHub: [@jtahun](https://github.com/jtahun)
