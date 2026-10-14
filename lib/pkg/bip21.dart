/// A payment request read from a QR code or the clipboard: either a bare
/// address or a BIP21 `bitcoin:` URI.
class PaymentRequest {
  const PaymentRequest(this.address, [this.amountSats]);

  /// Parses [text]. The scheme and bech32 addresses are case-insensitive
  /// (QR codes often upper-case them), so both are normalised to lower case.
  factory PaymentRequest.parse(String text) {
    var body = text.trim();
    String? query;
    if (body.toLowerCase().startsWith('bitcoin:')) {
      body = body.substring('bitcoin:'.length);
      final q = body.indexOf('?');
      if (q != -1) {
        query = body.substring(q + 1);
        body = body.substring(0, q);
      }
    }

    final lower = body.toLowerCase();
    final address = lower.startsWith('bc1') || lower.startsWith('tb1')
        ? lower
        : body;

    int? amount;
    if (query != null) {
      for (final param in query.split('&')) {
        final eq = param.indexOf('=');
        if (eq == -1 || param.substring(0, eq).toLowerCase() != 'amount') {
          continue;
        }
        amount = btcToSats(Uri.decodeComponent(param.substring(eq + 1)));
      }
    }
    return PaymentRequest(address, amount);
  }

  final String address;
  final int? amountSats;
}

/// Converts a decimal BTC amount such as `0.0015` to satoshis without going
/// through floating point. Returns null if [btc] is not a valid amount.
int? btcToSats(String btc) {
  final m = RegExp(r'^(\d*)(?:\.(\d{0,8}))?$').firstMatch(btc.trim());
  if (m == null || (m.group(1)!.isEmpty && (m.group(2) ?? '').isEmpty)) {
    return null;
  }
  final whole = int.parse(m.group(1)!.isEmpty ? '0' : m.group(1)!);
  final fraction = int.parse((m.group(2) ?? '').padRight(8, '0'));
  return whole * 100000000 + fraction;
}
