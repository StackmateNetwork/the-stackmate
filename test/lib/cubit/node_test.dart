import 'package:flutter_test/flutter_test.dart';
import 'package:sats/cubit/node.dart';

void main() {
  test('accepts electrum urls with a scheme and port', () {
    expect(NodeAddressCubit.isValidAddress(mainnetBlockstream), isTrue);
    expect(NodeAddressCubit.isValidAddress('tcp://127.0.0.1:50001'), isTrue);
    expect(
      NodeAddressCubit.isValidAddress('ssl://abcdefgh.onion:50002'),
      isTrue,
    );
  });

  test('rejects urls missing a scheme or port', () {
    expect(NodeAddressCubit.isValidAddress('electrum.blockstream.info'), isFalse);
    expect(
      NodeAddressCubit.isValidAddress('electrum.blockstream.info:50002'),
      isFalse,
    );
    expect(NodeAddressCubit.isValidAddress('ssl://host'), isFalse);
    expect(NodeAddressCubit.isValidAddress('http://host:80'), isFalse);
    expect(NodeAddressCubit.isValidAddress(''), isFalse);
  });
}
