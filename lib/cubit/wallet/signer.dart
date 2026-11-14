import 'package:sats/api/bitcoin_worker.dart';
import 'package:sats/api/interface/libbitcoin.dart';
import 'package:sats/cubit/chain-select.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/model/wallet.dart';

/// Resolves the descriptor used to sign transactions for a wallet.
///
/// The private descriptor is rebuilt from the stored mnemonic. Only wallets
/// created or recovered from a seed in this app can sign; others (watch-only
/// or wallet types from much older versions) cannot.
class WalletSigner {
  WalletSigner(this._core, this._masterKey, this._blockchain);

  final IStackMateBitcoin _core;
  final MasterKeyCubit _masterKey;
  final ChainSelectCubit _blockchain;

  static const missingKeyError = 'Signing key for this wallet not found.';
  static const cannotSignError = "This wallet can't sign transactions.";

  Future<String> signingDescriptor(Wallet wallet) async {
    if (!wallet.canSign) throw cannotSignError;

    final isSegwit = wallet.descriptor.startsWith('wpkh');
    final String mnemonic;
    if (isSegwit && wallet.walletType != WalletType.primary) {
      await _masterKey.getRecoverkey(wallet.fingerprint);
      mnemonic = _masterKey.state.rkey?.seed ?? (throw missingKeyError);
    } else {
      mnemonic = _masterKey.state.key?.seed ?? (throw missingKeyError);
    }

    final root = _core
        .importMaster(
          mnemonic: mnemonic,
          passphrase: wallet.passPhrase,
          network: _blockchain.state.blockchain.name,
        )
        .orThrow();

    final child = _core
        .deriveHardened(
          masterXPriv: root.xprv,
          account: '0',
          purpose: isSegwit ? '84' : '86',
        )
        .orThrow();

    return _core
        .compile(
          policy: 'pk(${child.fullXPrv}/*)',
          scriptType: isSegwit ? 'wpkh' : 'tr',
        )
        .orThrow();
  }
}
