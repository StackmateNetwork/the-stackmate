<h1 align="center">STACKMATE</h1> <div align="center">A multi-purpose Bitcoin Wallet</div> <br /> <p align="center"> <img style="height:500px" src="assets/icon/sm92.png"/> <p/> <br />

## Table of Contents

- [About](#about)
- [Goals](#goals)
- [Core](#core)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Flutter Development](#flutter-development)
  - [VSCode Explorer](#vscode-explorer)
  - [Exchange Rates API](#exchange-rates-api)
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

<br/>

### Flutter Development

Make sure Flutter (3.38+), the [Rust toolchain](https://rustup.rs) and, for Android, the Android NDK are installed.

```bash
flutter pub get
flutter run
```

Run [freezed](https://pub.dev/packages/freezed) code-gen while updating cubit state classes or model classes.

```bash
dart run build_runner watch --force-jit --delete-conflicting-outputs
```

<br/>

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
