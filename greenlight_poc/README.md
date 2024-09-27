# Greenlight POC

For now ... before you can run the app, edit file `greenlight_plugin/lib/constants.dart`
and replace the value of `kGLTokenValue` with valid proper user Staging token

Run in debug mode:

```sh
cd greenlight_poc
flutter clean && flutter pub get
flutter run -d YOUR_DEVICE_ID_HERE --release
```

Run in release mode:

```sh
cd greenlight_poc
flutter clean && flutter pub get
flutter run -d YOUR_DEVICE_ID_HERE --release
```

