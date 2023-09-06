import 'package:flutter_test/flutter_test.dart';
import 'package:sats/api/libbitcoin.dart';
import 'package:sats/cubit/new-wallet/common/xpub-import.dart';

void main() {
  // THE FOLLOWING WALLET NEEDS SYNC TO SUPPORT HIGHER MAX ADDRESS VALUE
  const seed0 =
      'famous frown october famous satisfy gasp bottle laptop leave close garage tuna';

  const seed1 =
      'tongue ring torch unhappy moral course sugar crucial tribe brush amount sheriff';

  const seed2 =
      'damage enter pony canvas dad matrix rug engine paper warfare orange quote';
  const myImportedWords =
      'burger arrest eight spin embrace outer green fine couch entry drastic kiwi';
  var expPublicDesc =
      'wpkh([8099ce1e/84h/1h/0h]tpubDCBjCC5aZ6wXLtZMSJDkBYZ3AFuors2YzzBhD5ZqP3uPqbzzH5YjD2CA9HDhUYNhrqq67v4XAN93KSbSL4bwa5hEvidkFuj7ycWA7EYzp41/*)';
  var expPrivateDesc =
      'wpkh([8099ce1e/84h/1h/0h]tprv8fVh3n3LQjFrTRXZYeZ9n8tvbEPshXqeRgauvZXXxn7117kDegj92XaHy9kVTH2zN9fXg8Ce4cpX5ihr9CBBAuA7DJSmdU2gVj3Xjd2T41G/*)';
  const nodeAddress = 'default';
  const network = 'test';
  // const _readableSoloPolicy = 'wpkh(___primary___)';
  const faucetReturnAddress = 'mkHS9ne12qx9pS9VojpwU5xtRd4T7X7ZUt';
  const returnAmount = 1000;
  const minerTxOutput = 'miner';
  const finalizedPsbt =
      'cHNidP8BAHQBAAAAATP//sNP6QoTAtgzs2Eof4+e95GYAQeLE1wWqs4tFSoRAQAAAAD9////AvwCAAAAAAAAFgAUdzOj/AqxHes2No9ip9nkUBeHzM1YAgAAAAAAABl2qRQ0Sg9IyhUOwrkDgXZgubaLE6ZwJoisAAAAAAABAN8BAAAAAAEBSon1NvP7dcSgLFyS3noWwD5D54uhcVlVKX43LU+wAB0AAAAAAP3///8CECcAAAAAAAAWABTB5EuPpQOVbyqPM6pHkQJUsKTBLTwJAAAAAAAAFgAUeO/Z0zlT3dQTQP3Aqkp6Z1XyEWMCSDBFAiEAorKfWQvy3zysktKtk/FRatxbopZlnDHzIxUaR87O56QCIHIleIl98pbPbXgYhearHMysQ47HLqLEEkx09T+3wflDASEDh9xUMJ5DYt5r7TVE+3nwazApjYVEKHMcg5QXqVA2HJMAAAAAAQEfPAkAAAAAAAAWABR479nTOVPd1BNA/cCqSnpnVfIRYyIGAyA0nu2ZNJECxF4M8iU9XHhINvajPckJ618FAvXbKLxGGICZzh5UAACAAQAAgAAAAIABAAAABAAAAAAiAgLiTSQCgBofPHrv4cRlx8wOMx6vLHHv2B2m4zRLXZTpcxiAmc4eVAAAgAEAAIAAAACAAQAAAAUAAAAAAA==';
  late LibBitcoin libstackmate;

  setUp(() async {
    libstackmate = LibBitcoin();
    final root = libstackmate.importMaster(
      mnemonic: myImportedWords,
      passphrase: '',
      network: network,
    );
    final derived = libstackmate.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: '0',
      purpose: '84',
    );
    expPrivateDesc = 'wpkh(${derived.result!.fullXPrv}/*)';
    expPublicDesc = 'wpkh(${derived.result!.fullXPub}/*)';
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
    final spenderPolicy = 'pk(${accountMasterKey.result!.fullXPrv}/*)';
    final watcherPolicy = 'pk(${accountMasterKey.result!.fullXPub}/*)';

    final privateDescriptor =
        libstackmate.compile(policy: spenderPolicy, scriptType: 'wpkh');
    assert(!privateDescriptor.hasError);
    assert(privateDescriptor.result == expPrivateDesc);

    final publicDescriptor =
        libstackmate.compile(policy: watcherPolicy, scriptType: 'wpkh');
    assert(!publicDescriptor.hasError);
    assert(publicDescriptor.result == expPublicDesc);
    final policyid =
        libstackmate.policyId(descriptor: privateDescriptor.result.toString());
    print(policyid.result);
    final ffiAddress0 = libstackmate.getAddress(
      descriptor: publicDescriptor.result!,
      index: '0',
    );
    assert(!ffiAddress0.hasError);
    // assert(ffiAddress0.result! == myAddress0);
  });
  test('Height of current block', () async {
    final height = libstackmate.getHeight(
      network: 'test', //test,main
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    assert(!height.hasError);
    print(height.result);
  });

  test('Wallet History & Balance Ops', () async {
    final history = libstackmate.getHistory(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    assert(!history.hasError);

    final balance = libstackmate.syncBalance(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    assert(!balance.hasError);

    final utxos = libstackmate.getUTXOSet(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    assert(!utxos.hasError);

    assert(!utxos.hasError);
  });

  test('SQLITE: Wallet History & Balance Ops', () async {});

  test('Wallet Transaction Flow', () async {
    final fees = libstackmate.estimateNetworkFee(
      network: network,
      nodeAddress: nodeAddress,
      socks5: 'none',
      targetSize: '6',
    );
    assert(!fees.hasError);

    const txOutputs = '$faucetReturnAddress:$returnAmount';

    final dummyBuildPsbt = libstackmate.buildTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
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
      socks5: 'none',
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

    // final txid = await libstackmate.broadcastTransaction(
    //   descriptor: expPublicDesc,
    //   nodeAddress: nodeAddress,
    //   socks5: 'none',
    //   signedPSBT: signedPsbt.result!.psbt,
    // );
    // assert(!txid.hasError);
  });

  test('Error States', () async {
    var response = await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
      signedPSBT: finalizedPsbt,
    );
    assert(response.hasError);
    // print(response);

    var errorMessage = response.error!;
    print(errorMessage);

    response = await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'blazed',
      signedPSBT: finalizedPsbt,
    );
    assert(response.hasError);
    errorMessage = response.error!;
    print(errorMessage);

    response = await libstackmate.broadcastTransaction(
      descriptor: expPublicDesc,
      nodeAddress: nodeAddress,
      socks5: 'none',
      signedPSBT: 'finalizedPsbt',
    );
    assert(response.hasError);
    errorMessage = response.error!;
    print(errorMessage);
    return;
  });
  test('2 of 3 multisig flow', () async {
    //step 1 generate xprv of 3 wallets

    final m0 = libstackmate.importMaster(
      mnemonic: myImportedWords,
      passphrase: '',
      network: network,
    );
    final m1 = libstackmate.importMaster(
      mnemonic: seed1,
      passphrase: '',
      network: network,
    );
    final m2 = libstackmate.importMaster(
      mnemonic: seed2,
      passphrase: '',
      network: network,
    );
    // print(m0.result!.xprv);
    // print(m1.result!.xprv);
    // print(m2.result!.xprv);
    //step 2 derive xpubs and xprvs from root xprvs of 3 wallets
    final xpub0 = libstackmate.deriveHardened(
      masterXPriv: m0.result!.xprv,
      account: '0',
      purpose: '84',
    );
    final xpub1 = libstackmate.deriveHardened(
      masterXPriv: m1.result!.xprv,
      account: '0',
      purpose: '84',
    );

    final xpub2 = libstackmate.deriveHardened(
      masterXPriv: m2.result!.xprv,
      account: '0',
      purpose: '84',
    );

    final Xpub0 =
        '[${xpub0.result!.fingerPrint}/${xpub0.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub0.result!.xpub}';

    final Xpub1 =
        '[${xpub1.result!.fingerPrint}/${xpub1.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub1.result!.xpub}';

    final Xpub2 =
        '[${xpub2.result!.fingerPrint}/${xpub2.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub2.result!.xpub}';

    // print(Xpub0);
    // print(Xpub1);
    // print(Xpub2);

    final Xprv0 =
        '[${xpub0.result!.fingerPrint}/${xpub0.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub0.result!.xprv}';
    final Xprv1 =
        '[${xpub1.result!.fingerPrint}/${xpub1.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub1.result!.xprv}';
    final Xprv2 =
        '[${xpub2.result!.fingerPrint}/${xpub2.result!.hardenedPath.replaceFirst('m/', '').replaceAll('h', "'")}]${xpub2.result!.xprv}';
    print(Xprv0);

    print('pk($Xprv0/*)');

    //step 3 create multisig descriptor wallets
    //final policy = 'thresh(2, pk($xprv0), pk($xpub1), pk($xpub2))';
    final multid0 = libstackmate.compile(
      policy: 'thresh(2,pk($Xprv0/*),pk($Xpub1/*),pk($Xpub2/*))',
      scriptType: 'wsh',
    );
    final multid1 = libstackmate.compile(
      policy: 'thresh(2,pk($Xpub0/*),pk($Xprv1/*),pk($Xpub2/*))',
      scriptType: 'wsh',
    );
    final multid2 = libstackmate.compile(
      policy: 'thresh(2,pk($Xpub0/*),pk($Xpub1/*),pk($Xprv2/*))',
      scriptType: 'wsh',
    );
    print(multid0.result);
    print(multid1.result);
    print(multid2.result);
    final multiAddress = libstackmate.getAddress(
      descriptor: multid0.result!,
      index: '0',
    );
    print(multiAddress.result);
    // final multiAddress1 = libstackmate.getAddress(
    //   descriptor: multid1.result!,
    //   index: '0',
    // );
    // print(multiAddress1.result);

    final balance = libstackmate.syncBalance(
      descriptor: multid0.result!,
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    print(balance.result);
    final history = libstackmate.getHistory(
      descriptor: multid0.result!,
      nodeAddress: nodeAddress,
      socks5: 'none',
    );
    print(history.result);
    final policyid =
        libstackmate.policyId(descriptor: multid0.result.toString());
    print(policyid.result);
  });
}
