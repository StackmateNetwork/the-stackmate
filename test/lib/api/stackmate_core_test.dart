// ignore: avoid_escaping_inner_quotes
import 'package:bitcoin/types.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/stackmate-core.dart';
import 'package:sats/model/transaction.dart';

void main() {
  const myAddress0 = 'tb1q6aw9ehm7zg7ppp5v0xdz3guwwu3fdehpypf6e2';
  const myImportedWords =
      'transfer spare party divorce screen used pole march warfare another balance find';
  const expPublicDesc =
      'wpkh([8099ce1e/84h/1h/0h]tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41/*)';
  const expPrivateDesc =
      'wpkh([8099ce1e/84h/1h/0h]tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/*)';
  const nodeAddress = 'default';
  const network = 'test';
  // const _readableSoloPolicy = 'wpkh(___primary___)';
  const faucetReturnAddress = 'mkHS9ne12qx9pS9VojpwU5xtRd4T7X7ZUt';
  const returnAmount = 600;
  const minerTxOutput = 'miner';
  const finalizedPsbt =
      'cHNidP8BAHQBAAAAATP//sNP6QoTAtgzs2Eof4+e95GYAQeLE1wWqs4tFSoRAQAAAAD9////AvwCAAAAAAAAFgAUdzOj/AqxHes2No9ip9nkUBeHzM1YAgAAAAAAABl2qRQ0Sg9IyhUOwrkDgXZgubaLE6ZwJoisAAAAAAABAN8BAAAAAAEBSon1NvP7dcSgLFyS3noWwD5D54uhcVlVKX43LU+wAB0AAAAAAP3///8CECcAAAAAAAAWABTB5EuPpQOVbyqPM6pHkQJUsKTBLTwJAAAAAAAAFgAUeO/Z0zlT3dQTQP3Aqkp6Z1XyEWMCSDBFAiEAorKfWQvy3zysktKtk/FRatxbopZlnDHzIxUaR87O56QCIHIleIl98pbPbXgYhearHMysQ47HLqLEEkx09T+3wflDASEDh9xUMJ5DYt5r7TVE+3nwazApjYVEKHMcg5QXqVA2HJMAAAAAAQEfPAkAAAAAAAAWABR479nTOVPd1BNA/cCqSnpnVfIRYyIGAyA0nu2ZNJECxF4M8iU9XHhINvajPckJ618FAvXbKLxGGICZzh5UAACAAQAAgAAAAIABAAAABAAAAAAiAgLiTSQCgBofPHrv4cRlx8wOMx6vLHHv2B2m4zRLXZTpcxiAmc4eVAAAgAEAAIAAAACAAQAAAAUAAAAAAA==';
  late BitcoinFFI libstackmate;

  setUp(() {
    libstackmate = BitcoinFFI();
  });
  test('Create New Wallet Flow', () async {
    var root = libstackmate.generateMaster(
      length: '19',
      passphrase: '',
      network: network,
    );
    assert(!root.hasError);
    assert(root.result!.neuList.length == 24);
    // show user
    // import from mnemonic from user
    root = libstackmate.importMaster(
      mnemonic: myImportedWords,
      passphrase: '',
      network: network,
    );

    assert(!root.hasError);

    final accountMasterKey = libstackmate.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: '0',
      purpose: '84',
    );

    assert(!accountMasterKey.hasError);
    // discard root
    // only use descriptors with account master keys
    final spenderPolicy =
        'pk([${accountMasterKey.result!.fingerPrint}${accountMasterKey.result!.hardenedPath.substring(1)}]${accountMasterKey.result!.xprv}/*)';
    final watcherPolicy =
        'pk([${accountMasterKey.result!.fingerPrint}${accountMasterKey.result!.hardenedPath.substring(1)}]${accountMasterKey.result!.xpub}/*)';

    final privateDescriptor =
        libstackmate.compile(policy: spenderPolicy, scriptType: 'wpkh');
    assert(!privateDescriptor.hasError);
    assert(privateDescriptor.result == expPrivateDesc);

    final publicDescriptor =
        libstackmate.compile(policy: watcherPolicy, scriptType: 'wpkh');
    assert(!publicDescriptor.hasError);
    assert(publicDescriptor.result == expPublicDesc);

    final ffiAddress0 = libstackmate.getAddress(
      descriptor: publicDescriptor.result!,
      index: '0',
    );
    assert(!ffiAddress0.hasError);
    assert(ffiAddress0.result! == myAddress0);
  });

  test('Wallet History & Balance Ops', () async {
    final history = libstackmate.getHistory(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
    );
    assert(!history.hasError);

    final int totalIn = history.result!.fold(
      0,
      (int sum, Transaction item) =>
          (item.sent == 0) ? sum + item.received : sum + 0,
    );
    final int totalOut = history.result!.fold(
      0,
      (int sum, Transaction item) =>
          (item.sent != 0) ? sum + item.sent + item.fee : sum + 0,
    );
    final inferredBalance = totalIn - totalOut;
    final balance = libstackmate.syncBalance(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
    );
    assert(!balance.hasError);
    assert(balance.result! == inferredBalance);

    final utxos = libstackmate.getUTXOSet(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
    );
    assert(!utxos.hasError);

    assert(!utxos.hasError);
  });

  test('Wallet Transaction Flow', () async {
    final fees = libstackmate.estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      targetSize: '6',
    );
    assert(!fees.hasError);

    const txOutputs = '$faucetReturnAddress:$returnAmount';

    final dummyBuildPsbt = libstackmate.buildTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      txOutputs: txOutputs,
      feeAbsolute: '1000',
      policyPath: '',
      sweep: 'false',
    );
    assert(!dummyBuildPsbt.hasError);

    final weight = libstackmate.getWeight(
      descriptor: expPublicDesc,
      psbt: dummyBuildPsbt.result!.psbt,
    );
    assert(!weight.hasError);

    final absoluteFees = libstackmate.feeRateToAbsolute(
      feeRate: fees.result!.toString(),
      weight: weight.result!.toString(),
    );
    assert(!absoluteFees.hasError);

    final feeRate = libstackmate.feeAbsoluteToRate(
      feeAbsolute: absoluteFees.result!.absolute.toString(),
      weight: weight.result!.toString(),
    );
    assert(!feeRate.hasError);

    final finalBuildPsbt = libstackmate.buildTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      txOutputs: txOutputs,
      feeAbsolute: absoluteFees.result!.absolute.toString(),
      policyPath: '',
      sweep: 'false',
    );
    assert(!finalBuildPsbt.hasError);
    assert(!finalBuildPsbt.result!.isFinalized);

    final decodedPsbt = libstackmate.decodePsbt(
      network: network,
      psbt: finalBuildPsbt.result!.psbt,
    );
    assert(!decodedPsbt.hasError);
    assert(decodedPsbt.result!.isNotEmpty);

    for (final output in decodedPsbt.result!) {
      if (output.to == faucetReturnAddress) {
        assert(output.value == returnAmount);
      } else if (output.to == minerTxOutput) {
        // show as fees
      } else {
        // this is change
        // check if this address isMine
      }
    }

    // THE ONLY OCCASION A PRIVATE DESCRIPTOR IS NEEDED
    final signedPsbt = libstackmate.signTransaction(
      descriptor: expPrivateDesc,
      unsignedPSBT: finalBuildPsbt.result!.psbt,
    );
    assert(!signedPsbt.hasError);
    assert(signedPsbt.result!.isFinalized);

    final txid = await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      signedPSBT: signedPsbt.result!.psbt,
    );
    assert(!txid.hasError);
  });

  test('Error States', () async {
    var response = await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      signedPSBT: finalizedPsbt,
    );
    assert(response.hasError);
    var structuredError = SMError.fromJson(response.error!);
    print(structuredError.oneliner);

    response = await libstackmate.broadcastTransaction(
      descriptor: '$expPublicDesc lko',
      nodeAddress: nodeAddress,
      signedPSBT: finalizedPsbt,
    );
    assert(response.hasError);
    structuredError = SMError.fromJson(response.error!);
    print(structuredError.oneliner);

    await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      signedPSBT: 'finalizedPsbt',
    );
    assert(response.hasError);
    structuredError = SMError.fromJson(response.error!);
    print(structuredError.oneliner);
    return;
  });
}
