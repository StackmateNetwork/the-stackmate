import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Passphrase.dart';
import 'package:sats/ui/component/common/CustomKeyboard.dart';
import 'package:sats/ui/component/common/textInput.dart';

class SeedImportSteps extends StatelessWidget {
  const SeedImportSteps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final step = context.select((SeedImportCubit sc) => sc.state.currentStep);

    switch (step) {
      case SeedImportStep.passphrase:
        return SeedImportPassphrase();
      case SeedImportStep.import:
        return const SeedImportPhrase();
    }
  }
}

class SeedImportPhrase extends StatelessWidget {
  const SeedImportPhrase();

  @override
  Widget build(BuildContext c) {
    final hasMaster = c.select((MasterKeyCubit mk) => mk.state.key != null);
    final state = c.select((SeedImportCubit _) => _.state);
    final textController = TextEditingController(text: 'a');
    final w = c.select((WordsCubit _) => _.state);
    final focusNodes = List<FocusNode>.generate(12, (index) => FocusNode());

    void returnClicked(int idx) {
      if (idx == 11) return;
      focusNodes[idx + 1].requestFocus();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Import your seed phrase',
          style: c.fonts.headlineSmall!.copyWith(
            color: c.colours.onPrimary,
            // fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    for (var i = 0; i < 6; i++)
                      ImportWordTextField(
                        index: i,
                        focusNode: focusNodes[i],
                        returnClicked: returnClicked,
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    for (var i = 6; i < 12; i++)
                      ImportWordTextField(
                        index: i,
                        focusNode: focusNodes[i],
                        returnClicked: returnClicked,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // if (!state.showSeedCompleteButton())
        //   SizedBox(
        //     height: 52,
        //     child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //         foregroundColor: c.colours.background,
        //         backgroundColor: c.colours.primary,
        //       ),
        //       onPressed: () {
        //         c.read<SeedImportCubit>().seedValidate(textController.text);
        //       },
        //       child: const Text('Validate seed'),
        //     ),
        //   ),
        const SizedBox(height: 24),
        SizedBox(
          height: 52,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: c.colours.background,
              backgroundColor: c.colours.primary,
            ),
            onPressed: () async {
              final FocusScopeNode currentFocus = FocusScope.of(c);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
              if (!hasMaster) {
                await c.read<SeedImportCubit>().checkSeed();
                c.read<SeedImportWalletCubit>().nextClicked();
              } else {
                c.read<SeedImportCubit>().gotoPassPhrase();
              }
            },
            child: const Text('Next'),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              BuiltInKeyboard(
                color: c.colours.primary,
                width: 26,
                height: 45,
                letterStyle:
                    TextStyle(fontSize: 20, color: c.colours.background),
                borderRadius: BorderRadius.circular(1),
                controller: textController,
                enableSpaceBar: true,
              ),
              // KeyboardSuggestionsView(
              //   suggestions: [
              //     Suggestion<String>(
              //       title: w.findWords(textController.text).join(','),
              //       value: w.findWords(textController.text).join(','),
              //     ),
              //     Suggestion<String>(
              //       title: w.findWords(textController.text).join(','),
              //       value: w.findWords(textController.text).join(','),
              //     ),
              //   ],
              //   onTap: (String) {
              //     print(w.findWords(textController.text).join(' '));
              //   },
              //   backgroundColor: c.colours.primary,
              //   textStyle: const TextStyle(fontSize: 20, color: Colors.cyan),
              // )
            ],
          ),
        ),
      ],
    );
  }
}

class ImportWordTextField extends StatefulWidget {
  const ImportWordTextField({
    super.key,
    required this.index,
    required this.focusNode,
    required this.returnClicked,
  });

  final int index;
  final FocusNode focusNode;
  final Function(int) returnClicked;

  @override
  State<ImportWordTextField> createState() => _ImportWordTextFieldState();
}

class _ImportWordTextFieldState extends State<ImportWordTextField> {
  OverlayEntry? entry;
  final layerLink = LayerLink();
  final controller = TextEditingController();
  List<String> suggestions = [];
  bool tapped = false;

  @override
  void initState() {
    super.initState();

    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        showOverLay();
      } else
        hideOverlay();
    });

    controller.addListener(() {
      // if (suggestions.isNotEmpty
      //     // && suggestions.contains(controller.text)
      //     ) return;

      hideOverlay();
      setState(() {
        suggestions =
            context.read<WordsCubit>().state.findWords(controller.text);
      });
      if (tapped) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showOverLay();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    widget.focusNode.dispose();

    super.dispose();
  }

  void showOverLay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width - 24,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(24, size.height - 8),
          child: buildOverlay(),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  Widget buildOverlay() {
    if (suggestions.isEmpty) {
      hideOverlay();
      return Container();
    }

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          for (final word in suggestions)
            ListTile(
              title: Text(word),
              onTap: () {
                // context
                //     .read<ImportWalletCubit>()
                //     .wordChanged12(widget.index, word, true);
                hideOverlay();
                setState(() {
                  tapped = true;
                });
                widget.focusNode.unfocus();
                widget.returnClicked(widget.index);
              },
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final word = context.select(
      (WordsCubit cubit) => cubit.state.words?.elementAtOrNull(widget.index),
    );

    if (word == null) return const SizedBox.shrink();
    if (controller.text != word) controller.text = word;

    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        height: 45,
        child: Row(
          children: [
            SizedBox(
              width: 25,
              child: Text(
                '${widget.index + 1}',
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: CallbackShortcuts(
                bindings: {
                  LogicalKeySet(LogicalKeyboardKey.enter): () {
                    if (widget.focusNode.hasFocus)
                      widget.returnClicked(widget.index);
                  },
                },
                child: AnimatedOpacity(
                  duration: 200.ms,
                  opacity: 0.5,
                  child: BBTextInput.small(
                    focusNode: widget.focusNode,
                    controller: controller,
                    onEnter: () {
                      // context.read<ImportWalletCubit>().clearUntappedWords();
                    },
                    onChanged: (value) {
                      // context
                      //     .read<ImportWalletCubit>()
                      //     .wordChanged12(widget.index, value, false);
                      hideOverlay();

                      setState(() {
                        tapped = false;
                      });
                    },
                    value: word,
                  ),
                ),
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
