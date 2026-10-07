<h1 align="center">STACKMATE</h1> <div align="center">A multi-purpose Bitcoin Wallet</div> <br /> <p align="center"> <img style="height:500px" src="assets/icon/sm92.png"/> <p/> <br />

## Table of Contents

- [About](#about)
- [Goals](#goals)
- [Core](#core)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Run](#run)
  - [Tests](#tests)
  - [Release build](#release-build)
  - [Troubleshooting](#troubleshooting)
  - [Upgrading an existing install](#upgrading-an-existing-install)
  - [VSCode Explorer](#vscode-explorer)
- [Maintainers](#maintainers)
- [Contribution](#contribution)
- [License](#license)

## About

At Stackmate, we build software to enable self-sovereignty. We are and will always only ever be managed by Bitcoin remnants.

Our software is free from VC, fiat or shitcoin influences and we actively work to ward off such attempts.

All our software is FOSS. Feel free to do as you please with it.

## Goals

We aim to achieve:

1. Simplicity
2. Safety
3. Speed

Prioritized in that order.

## Core

This app uses [BDK](https://bitcoindevkit.org/) via the official [bdk_dart](https://pub.dev/packages/bdk_dart) bindings for its Bitcoin specific logic (descriptors, sync, PSBT building/signing and fee bumping).
<br/>
Tor is provided by the [arti](https://gitlab.torproject.org/tpo/core/arti)-based [tor](https://pub.dev/packages/tor) plugin.
<br/>
Both are Rust libraries that are compiled automatically during `flutter build` / `flutter run`.

## Features

- **Descriptors** uses descriptor wallet specifications for simplicity in development and compatability in recovery
- **PSBT** uses psbt specifications to support watch-only wallets and compatability with hardware wallets
- **Taproot** supports taproot for single-sig to improve the overall anonymity set of bitcoin transactions
- **RBF** bump the fee of unconfirmed outgoing transactions (BIP125 replace-by-fee)
- **Cross Platform:** built using Flutter 💙 and Rust, allowing easy extension to multiple platforms

## Getting Started

### Prerequisites

| Tool | Version | Notes |
| --- | --- | --- |
| [Flutter](https://docs.flutter.dev/get-started/install) | 3.38.x (Dart 3.10) | Dart `^3.10.0` is required by `bdk_dart`. |
| [Rust](https://rustup.rs) via `rustup` | stable | Install with `rustup`, not Homebrew. BDK pins its own toolchain (1.85.1) and rustup installs it automatically on the first build. |
| JDK | 17 | Required by Android Gradle Plugin 8.11. |
| Android SDK | platform 36, build-tools 36 | The NDK version Flutter expects (28.2.x) is downloaded by Gradle on the first build. |
| Xcode (iOS only) | 26+ | Deployment target is iOS 14.0. |

Install the Rust Android targets for the stable toolchain (used by the Tor plugin):

```bash
rustup target add aarch64-linux-android armv7-linux-androideabi x86_64-linux-android
```

Point Flutter at JDK 17 if it is not your default Java. For example, with Homebrew on macOS:

```bash
brew install openjdk@17
flutter config --jdk-dir="$(brew --prefix openjdk@17)/libexec/openjdk.jdk/Contents/Home"
flutter doctor   # "Android toolchain" should show a check mark
```

### Setup

```bash
git clone git@github.com:StackmateNetwork/the-stackmate.git
cd the-stackmate
flutter pub get
```

Generated files (`*.freezed.dart`, `*.g.dart`) are committed. Regenerate them after changing a cubit state or model class:

```bash
dart run build_runner build --force-jit --delete-conflicting-outputs
```

`--force-jit` is required, because `bdk_dart` uses Dart build hooks, which the default AOT builder compilation does not support.

### Run

Start an emulator (an `arm64-v8a` image on Apple Silicon) or connect a device, then run:

```bash
flutter emulators --launch <emulator_id>   # list ids with `flutter emulators`
flutter run
```

The first build compiles BDK and Tor (arti) from Rust, so it can take 10–20 minutes. Later builds are incremental.

To build an APK without running it:

```bash
flutter build apk --debug --target-platform android-arm64
# output: build/app/outputs/flutter-apk/app-debug.apk
```

### Tests

```bash
flutter analyze
flutter test
```

`test/lib/api/libbitcoin_test.dart` runs BDK against a temporary SQLite wallet and needs no network. It checks BIP84/86 test vectors, the legacy address scheme, building and signing transactions, and RBF fee bumps. These tests build the BDK native library for your host machine, so the Rust toolchain must be installed.

### Release build

Create `android/key.properties`. This file is git-ignored; never commit it.

```properties
storeFile=/absolute/path/to/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

```bash
flutter build apk --release
```

Without `key.properties`, release builds are signed with the debug key.

### Troubleshooting

- **`Could not determine java version` / Gradle fails to start:** install JDK 17 and run `flutter config --jdk-dir` as shown above.
- **`ld: tapi error: malformed file ... unknown architecture` when running `flutter test` or `build_runner` on macOS:** your Command Line Tools ship a newer macOS SDK than your Xcode's linker understands. Update Xcode so it matches the Command Line Tools (`xcrun --show-sdk-path` should point to a SDK your Xcode supports). Android and iOS builds are not affected.
- **`'dart compile' does not support build hooks`:** add `--force-jit` to the `build_runner` command.

### Upgrading an existing install

Wallets created with the old stackmate-core engine keep their descriptors, addresses and keys. On the first sync after upgrading, each wallet re-downloads its history into a new `<wallet>.db.bdk` file. This takes longer than a normal sync, and no data is lost.

### VSCode Explorer

Visibility of files and folders can be toggled from

    .vscode/
        └── settings.json

<br/>

## Maintainers

[Morteza](https://github.com/mocodesmo)

[Vishal](https://github.com/i5hi)

[Yashwanth](https://github.com/yashwanthambati)

## Contribution

We are very active on git and we do our best to respond to contributers quickly.

Feel free to express yourself in the Issues section.

## License

[MIT](https://github.com/mocodesmo/stackmate/blob/main/LICENSE)
