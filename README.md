# AKI DateTime Picker

A lightweight and cupertino date time picker.

| ![single-mode-picker](https://user-images.githubusercontent.com/17869748/169690600-de51bee2-6f59-4f6a-95bf-c55e00dc54ae.gif) | ![multi-mode-picker](https://user-images.githubusercontent.com/17869748/169690730-e9cb5b29-8994-4e46-905e-83a14cc19809.gif) | ![range-picker-mode](https://user-images.githubusercontent.com/17869748/169690843-a7dc3fc2-0598-4050-aee0-e676d3a98c6c.gif) | ![dialog-function](https://user-images.githubusercontent.com/17869748/169691322-04404a63-53ff-4f90-a183-8d658806dedc.gif) |
| :--------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------------------------: | :-----------------------------------------------------------------------------------------------------------------------: |
|                                                       **single mode**                                                        |                                                       **multi mode**                                                        |                                                       **range mode**                                                        |                                                    **dialog function**                                                    |

## Intro

AKI DateTime Picker consists of two main widgets:

- `AKI DateTime Picker`, this widget only includes the calendar UI and will emit event whenever user taps a different date.

## Features



## How to use

**Make sure to check out [examples](https://github.com/theideasaler/calendar_date_picker2/tree/main/example) for more details.**

### Installation

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  aki_datetime_picker: ^0.5.2
```

### Basic setup


```dart
AkiDateTimePicker(
  value: _dates,
  onValueChanged: (dateString) => _dates = dateString,
);
```



## Multi-language support

This package has multi-language supports. To enable it, add your `Locale` into the wrapping `MaterialApp`:

```dart
MaterialApp(
  localizationsDelegates: GlobalMaterialLocalizations.delegates,
  supportedLocales: const [
    Locale('en', ''),
    Locale('zh', ''),
    Locale('ru', ''),
    Locale('es', ''),
    Locale('hi', ''),
  ],
  ...
);
```



Feel free to contribute to this project. 🍺 Pull requests are welcome!

There are some tips before creating a PR:

- Please always create an issue/feature before raising a PR
- Please always create a minimum reproducible example for an issue
- Please use the official [Dart Extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) as your formatter or use `flutter format . -l 80` if you are not using VS Code
- Please keep your changes to its minimum needed scope (avoid introducing unrelated changes)
- Please follow this git commit [convention](https://www.conventionalcommits.org/en/v1.0.0-beta.2/) by adding `feat:` or `fix:` to your PR commit