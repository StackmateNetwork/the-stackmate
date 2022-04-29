import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sats/cubit/wallets.dart';
import 'package:sats/pkg/extensions.dart';

class WalletInfo extends StatelessWidget {
  const WalletInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext c) {
    final wallet = c.select((WalletsCubit wc) => wc.state.selectedWallet!);

    if (wallet.walletType == 'INHERITANCE')
      return FadeIn(
        delay: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    Text(
                      'MAIN WALLET\nINFORMATION',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Public Key',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      wallet.policy,
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        c.read<WalletsCubit>().copyDescriptor(wallet.policy);
                      },
                      child: const Text('COPY'),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'Fingerprint',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      wallet.policy,
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        c.read<WalletsCubit>().copyDescriptor(wallet.policy);
                      },
                      child: const Text('COPY'),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Path',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      wallet.policy,
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        c.read<WalletsCubit>().copyDescriptor(wallet.policy);
                      },
                      child: const Text('COPY'),
                    ),

                    // Container(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   width: c.width * 0.8,
                    //   child: Text(
                    //     wallet.mainWallet.descriptor!,
                    //     maxLines: 10,
                    //     textAlign: TextAlign.left,
                    //     style: c.fonts.caption!.copyWith(
                    //       color: c.colours.onBackground.withOpacity(0.9),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       c.read<WalletsCubit>().copyDescriptor();
                    //     },
                    //     child: const Text('COPY'),
                    //   ),
                    // ),

                    // for (var transaction in transactions)
                    //   TransactionCell(transaction: transaction),

                    // if (!state.loadingTransactions) ...[
                    //   SizedBox(height: 24),
                    //   Center(
                    //       child: TextButton(
                    //           onPressed: () {
                    //             c.read<HistoryCubit>().getHistory();
                    //           },
                    //           child: Text('Load More'))),
                    //   SizedBox(height: 24),
                    // ]
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    Text(
                      'WALLET INFORMATION',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (true) ...[
                      const SizedBox(height: 24),
                      Text(
                        'Primary Public Key',
                        style: c.fonts.overline!.copyWith(
                          color: c.colours.onBackground,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        wallet.policyElements[0],
                        style: c.fonts.caption!.copyWith(
                          color: c.colours.onBackground,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    Text(
                      'Secondary Extended Public Key',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      wallet.policyElements[1],
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        c.read<WalletsCubit>().copyDescriptor(wallet.policy);
                      },
                      child: const Text('COPY'),
                    ),
                    const SizedBox(height: 24),

                    Text(
                      'TimeLock',
                      style: c.fonts.overline!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    const SizedBox(height: 8),

                    Text(
                      wallet.policyElements[2],
                      style: c.fonts.caption!.copyWith(
                        color: c.colours.onBackground,
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                        alignment: Alignment.centerLeft,
                      ),
                      onPressed: () {
                        c.read<WalletsCubit>().copyDescriptor(wallet.policy);
                      },
                      child: const Text('COPY'),
                    ),
                    const SizedBox(height: 24),

                    // Container(
                    //   padding: const EdgeInsets.only(left: 16),
                    //   width: c.width * 0.8,
                    //   child: Text(
                    //     wallet.mainWallet.descriptor!,
                    //     maxLines: 10,
                    //     textAlign: TextAlign.left,
                    //     style: c.fonts.caption!.copyWith(
                    //       color: c.colours.onBackground.withOpacity(0.9),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 16),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: TextButton(
                    //     onPressed: () {
                    //       c.read<WalletsCubit>().copyDescriptor();
                    //     },
                    //     child: const Text('COPY'),
                    //   ),
                    // ),

                    // for (var transaction in transactions)
                    //   TransactionCell(transaction: transaction),

                    // if (!state.loadingTransactions) ...[
                    //   SizedBox(height: 24),
                    //   Center(
                    //       child: TextButton(
                    //           onPressed: () {
                    //             c.read<HistoryCubit>().getHistory();
                    //           },
                    //           child: Text('Load More'))),
                    //   SizedBox(height: 24),
                    // ]
                  ],
                ),
              ),
            ],
          ),
        ),
      );

    return FadeIn(
      delay: const Duration(milliseconds: 300),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            Text(
              'WALLET\nINFORMATION',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 24),
            Text(
              'Extended Public Key',
              style: c.fonts.overline!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
            const SizedBox(height: 8),

            Text(
              wallet.policyElements[0].split(':')[1],
              style: c.fonts.caption!.copyWith(
                color: c.colours.onBackground,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () {
                c
                    .read<WalletsCubit>()
                    .copyDescriptor(wallet.policyElements[0].split(':')[1]);
              },
              child: const Text('COPY'),
            ),
            const SizedBox(height: 24),

            Text(
              'Only your mnemonic and passphrase are enough to recover this wallet.',
              style: c.fonts.caption!.copyWith(
                color: c.colours.onPrimary,
              ),
            ),

            // Container(
            //   padding: const EdgeInsets.only(left: 16),
            //   width: c.width * 0.8,
            //   child: Text(
            //     wallet.mainWallet.descriptor!,
            //     maxLines: 10,
            //     textAlign: TextAlign.left,
            //     style: c.fonts.caption!.copyWith(
            //       color: c.colours.onBackground.withOpacity(0.9),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: TextButton(
            //     onPressed: () {
            //       c.read<WalletsCubit>().copyDescriptor();
            //     },
            //     child: const Text('COPY'),
            //   ),
            // ),

            // for (var transaction in transactions)
            //   TransactionCell(transaction: transaction),

            // if (!state.loadingTransactions) ...[
            //   SizedBox(height: 24),
            //   Center(
            //       child: TextButton(
            //           onPressed: () {
            //             c.read<HistoryCubit>().getHistory();
            //           },
            //           child: Text('Load More'))),
            //   SizedBox(height: 24),
            // ]
          ],
        ),
      ),
    );
  }
}
