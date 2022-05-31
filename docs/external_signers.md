# External Signers

This example uses bdk-cli as a `signer` and stackmate as a `watcher`.

## Create or restore a seed

```bash
bdk-cli key restore --mnemonic 'transfer spare party divorce screen used pole march warfare another balance find'                                        01:10:37 AM
{
  "fingerprint": "8099ce1e",
  "xprv": "tprv8ZgxMBicQKsPctM9UgftwPdDCxMq2c57utsBu5htMG7ySHZzT33jWyiSBQJwvjDEoMHmZGFgezhVTyKmiKfdPtdFtoAAdSzFYdstokvpop1"
}
```

## Derive account keys

```bash
bdk-cli key derive --xprv tprv8ZgxMBicQKsPctM9UgftwPdDCxMq2c57utsBu5htMG7ySHZzT33jWyiSBQJwvjDEoMHmZGFgezhVTyKmiKfdPtdFtoAAdSzFYdstokvpop1 --path "m/84h/1h/0h"
{
  "xprv": "[8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/*",
  "xpub": "[8099ce1e/84'/1'/0']tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41/*"
}
```

## Create descriptor

bdk-cli no longer supports the policy command, so we will just build the descriptor by hand.

`wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/*)`

## Sync bdk-cli wallet

```bash
bdk-cli wallet -d "wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/0/*)" 
-c"wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/1/*)" sync

bdk-cli wallet -d "wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/0/*)" 
-c"wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/1/*)" get_balance

```

## Import wallet into stackmate

Create a stackmate watcher wallet by importing the following pubkey:

`[8099ce1e/84'/1'/0']tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41`

Confirm that the wallet created is correct based on balance.

## Build and copy transaction on stackmate watcher

## Sign transaction on bdk-cli

Substitute $PSBT for the psbt copied from stackmate.

```bash
bdk-cli wallet -d "wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/0/*)" 
-c"wpkh([8099ce1e/84'/1'/0']tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/1/*)" sign --psbt $PSBT
```

## Broadcast transaction on stackmate
