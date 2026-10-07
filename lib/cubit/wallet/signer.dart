import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/model/core.dart';
import 'package:sats/model/wallet.dart';

/// Resolves the descriptor used to sign transactions for a wallet.
///
/// Signer wallets get a private descriptor rebuilt from the stored mnemonic;
/// watch-only wallets get their public descriptor back, which yields a PSBT
/// that still needs external signatures.
class WalletSigner {
  WalletSigner(this._core, this._masterKey, this._blockchain);

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final ChainSelectCubit _blockchain;

  static const primaryWalletType = 'PRIMARY';
  static const recoveredWalletType = 'RECOVERED';

  static bool canSign(Wallet wallet) =>
      wallet.walletType == primaryWalletType ||
      wallet.walletType == recoveredWalletType;

  Future<String> signingDescriptor(Wallet wallet) async {
    if (!canSign(wallet)) return wallet.descriptor;

    final isSegwit = wallet.descriptor.startsWith('wpkh');
    final String mnemonic;
    if (isSegwit && wallet.walletType != primaryWalletType) {
      await _masterKey.getRecoverkey(wallet.fingerprint);
      mnemonic = _masterKey.state.rkey!.seed!;
    } else {
      mnemonic = _masterKey.state.key!.seed!;
    }

    final root = _core.importMaster(
      mnemonic: mnemonic,
      passphrase: wallet.passPhrase,
      network: _blockchain.state.blockchain.name,
    );
    if (root.hasError) throw SMError.fromJson(root.error!).message;

    final child = _core.deriveHardened(
      masterXPriv: root.result!.xprv,
      account: '0',
      purpose: isSegwit ? '84' : '86',
    );
    if (child.hasError) throw SMError.fromJson(child.error!).message;

    final descriptor = _core.compile(
      policy: 'pk(${child.result!.fullXPrv}/*)',
      scriptType: isSegwit ? 'wpkh' : 'tr',
    );
    if (descriptor.hasError) throw SMError.fromJson(descriptor.error!).message;
    return descriptor.result!;
  }
}
