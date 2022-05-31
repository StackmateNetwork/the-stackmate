# Privacy Policy

Stackmate is designed to maximize self-sovereignty and minimize dependency and trust in third parties.

## Tor By Default

The client comes bundled with Tor, which is a requirement to make network calls from the app.

This protects you from being fingerprinted via IP address by a backend service providers.

## Backend Service Provider Defaults

All backend services can be substituted with your own services or be entirely opted out of.

We use the following services as default:

### Electrum Node

`Blockstream`

This is the core backend service required to sync your wallet public data and also broadcast transactions.

This can be your own server.

### Exchange Rate

Coming soon

### Blockexplorer

`BullBitcoin`

This is used to view transactions on an explorer to study its path in depth.

This can be your own server.

## Telemetry

The app currently uses no telemetry.

## Platform Specific Considerations

Android users must ensure that they disable GBoards analytics or entirely opt-out and try options like OpenBoards.

The moment private data is either copied to a clipboard or typed by GBoard, it will have severely degraded in its integrity.

### Permissions

#### Camera

The app currently requires permission to use your camera ONLY when scanning a Bitcoin address or Public Key.

#### Biometrics

To use native authentication to access the app.

## Bitcoin Specific Considerations

Imported wallets currently estimate your last used address index based on your transaction history.

You have the ability to manually increment your index if you believe the estimations are not accurate.
