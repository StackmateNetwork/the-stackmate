import 'package:flutter_test/flutter_test.dart';
import 'package:sats/pkg/bip21.dart';

void main() {
  const address = 'tb1q6rz28mcfaxtmd6v789l9rrlrusdprr9pqcpvkl';

  test('a bare address is kept as is', () {
    final r = PaymentRequest.parse('  $address\n');
    expect(r.address, address);
    expect(r.amountSats, isNull);
  });

  test('base58 addresses keep their case', () {
    const legacy = '1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2';
    expect(PaymentRequest.parse(legacy).address, legacy);
  });

  test('upper-case bech32 and scheme are normalised', () {
    final r = PaymentRequest.parse('BITCOIN:${address.toUpperCase()}');
    expect(r.address, address);
  });

  test('reads the amount wherever it sits in the query', () {
    expect(
      PaymentRequest.parse('bitcoin:$address?amount=0.0015').amountSats,
      150000,
    );
    expect(
      PaymentRequest.parse('bitcoin:$address?label=Coffee&amount=1')
          .amountSats,
      100000000,
    );
  });

  test('a URI without an amount has none', () {
    final r = PaymentRequest.parse('bitcoin:$address?label=Coffee');
    expect(r.address, address);
    expect(r.amountSats, isNull);
  });

  test('btcToSats is exact and rejects bad input', () {
    expect(btcToSats('0.00000001'), 1);
    expect(btcToSats('.5'), 50000000);
    expect(btcToSats('21000000'), 2100000000000000);
    expect(btcToSats('0.1'), 10000000);
    expect(btcToSats('1.123456789'), isNull);
    expect(btcToSats('abc'), isNull);
    expect(btcToSats(''), isNull);
    expect(btcToSats('.'), isNull);
  });
}
