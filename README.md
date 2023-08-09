# AKI DateTime Picker

A lightweight and cupertino date time picker.

![Screen Shot](https://raw.githubusercontent.com/AKI-YU/file/main/screenshots/device-2023-08-09-154508.gif){ height: 200px; }


## Intro

AKI DateTime Picker consists of three main widgets:

- `AKI DateTime Picker`, this widget can make a cupertino picker and to help users to select date and time.

- `AKI Date Picker`, this widget can make a cupertino picker and to help users to select only date.

- `AKI Time Picker`, this widget can make a cupertino picker and to help users to select only time.

### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  aki_datetime_picker: ^1.0.0
```


## How to use

```dart
import 'package:aki_datetime_picker/aki_datetime_picker.dart';
```

## basic use

```dart

AKIDateTimePicker(
  onChange: (v) {
    debugPrint(v.toString());
  }),
                    
```

## Customized


```dart

AKIDateTimePicker(
  borderColor: Colors.blue,
  colorMask: Colors.red.withOpacity(0.1),
  selDate: DateTime.now(),
  startYear: 2020,
  endYear: 2025,
  lblYear: "年",
  lblMonth: "月",
  lblDay: "日",
  lblHour: "時",
  lblMin: "分",
  lblColor: Colors.blue,
  textColor: Colors.green,
  onChange: (v) {
    debugPrint(v.toString());
  }),
                    
```

Feel free to contribute to this project. 🍺 Pull requests are welcome!

There are some tips before creating a PR:

- Please always create an issue/feature before raising a PR
- Please always create a minimum reproducible example for an issue
- Please use the official [Dart Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) as your formatter or use `flutter format . -l 80` if you are not using VS Code
- Please keep your changes to its minimum needed scope (avoid introducing unrelated changes)
- Please follow this git commit [convention](https://www.conventionalcommits.org/en/v1.0.0-beta.2/) by adding `feat:` or `fix:` to your PR commit