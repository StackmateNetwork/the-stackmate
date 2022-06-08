<h1 align="center">STACKMATE</h1> <div align="center">A multi-purpose Bitcoin Wallet</div> <br /> <p align="center"> <img style="height:500px" src="demo.png"/> <p/> <br />

## About

At Stackmate, we build software to enable self-sovereignty. We are and will always only ever be managed by Bitcoin remnants.

Our software is free from VC, Fiat or Shitcoin influences and we actively work to warding off such influences.

This software is FOSS. Feel free to do as you please with it.

Before forking, we urge you to start a conversation with us and contribute.

## Table of Contents

- [Core](#core)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Flutter Development](#flutter-development)
  - [VSCode Explorer](#vscode-explorer)
  - [Exchange Rates API](#exchange-rates-api)
  - [Updating stackmate-core](#updating-stackmate-core)
- [Maintainers](#maintainers)
- [License](#license)

## Core

This app uses [stackmate-core](https://github.com/i5hi/stackmate-core) for it's Bitcoin specific logic.
<br/>
[stackmate-core](https://github.com/i5hi/stackmate-core) is built using Rust.
<br/>
This app communicates with [stackmate-core's](https://github.com/i5hi/stackmate-core) Rust binary via FFI.

## Features

- **modern descriptor wallets:** uses all the latest technologies from the Bitcoin ecosystem
- **address book:** store and organise public descriptors
- **calculator:** calculate current exchange rates with our built-in calculator
- **cross platform:** built using Flutter 💙 and Rust

## Getting Started

<br/>

### Flutter Development

Make sure Flutter and Dart are installed.

```bash
flutter pub get
flutter run
```

Run [freezed](https://pub.dev/packages/freezed) code-gen while updating cubit state classes or model classes.

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

<br/>

### VSCode Explorer

Visibility of files and folders can be toggled from

    .vscode/
        └── settings.json

<br/>

### Exchange Rates API

The [coincap](https://docs.coincap.io/) API is currently implemented for calculating exchange rates.
<br/>
Request an API Key from [coincap](https://docs.coincap.io/) and update the `_apiKey` in

    lib/
    └── api/
        └── rates.dart

<br/>

### Updating stackmate-core

_Optional Advanced Usage_
<br/>
Make sure Rust and Android NDK are installed.

```bash
cd packages/bitcoin
sh update-core.sh
```

<br/>
<br/>

## Maintainers

[Morteza](https://github.com/mocodesmo)

[Vishal](https://github.com/i5hi)

## License

[MIT](https://github.com/mocodesmo/stackmate/blob/main/LICENSE)
