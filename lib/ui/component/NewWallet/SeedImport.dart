import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Passphrase.dart';
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

    final focusNodes = List<FocusNode>.generate(12, (index) => FocusNode());

    void returnClicked(int idx) {
      if (idx == 11) return;
      focusNodes[idx + 1].requestFocus();
    }

    final focusNodes24 = List<FocusNode>.generate(24, (index) => FocusNode());

    void returnClicked24(int idx) {
      if (idx == 23) return;
      focusNodes24[idx + 1].requestFocus();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SegmentedButton(
                segments: <ButtonSegment<ImportTypes>>[
                  ButtonSegment(
                    value: ImportTypes.words12,
                    label: Text(
                      '12',
                      style: TextStyle(
                        color: c.colours.onBackground,
                      ),
                    ),
                  ),
                  ButtonSegment(
                    value: ImportTypes.words24,
                    label: Text(
                      '24',
                      style: TextStyle(
                        color: c.colours.onBackground,
                      ),
                    ),
                  ),
                ],
                selected: <ImportTypes>{
                  if (state.importType == ImportTypes.words12)
                    ImportTypes.words12
                  else
                    ImportTypes.words24,
                },
                onSelectionChanged: (p0) {
                  if (state.importType == ImportTypes.words12)
                    c.read<SeedImportCubit>().recoverClicked24();
                  else
                    c.read<SeedImportCubit>().recoverClicked();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (state.importType == ImportTypes.words12)
              Row(
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
              )
            else
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        for (var i = 0; i < 12; i++)
                          ImportWordTextField24(
                            index: i,
                            focusNode: focusNodes24[i],
                            returnClicked: returnClicked24,
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        for (var i = 12; i < 24; i++)
                          ImportWordTextField24(
                            index: i,
                            focusNode: focusNodes24[i],
                            returnClicked: returnClicked24,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 15),
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
            //const SizedBox(height: 5),
          ],
        ),
      ),
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
                context
                    .read<SeedImportCubit>()
                    .wordChanged12(widget.index, word, true);
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
      (SeedImportCubit cubit) =>
          cubit.state.words12.elementAtOrNull(widget.index),
    );

    if (word == null) return const SizedBox.shrink();
    if (controller.text != word.word) controller.text = word.word;

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
                  opacity: !word.tapped ? 0.5 : 1,
                  child: BBTextInput.small(
                    focusNode: widget.focusNode,
                    controller: controller,
                    onEnter: () {
                      context.read<SeedImportCubit>().clearUntappedWords();
                    },
                    onChanged: (value) {
                      context
                          .read<SeedImportCubit>()
                          .wordChanged12(widget.index, value, false);
                      hideOverlay();

                      setState(() {
                        tapped = false;
                      });
                    },
                    value: word.word,
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

class ImportWordTextField24 extends StatefulWidget {
  const ImportWordTextField24({
    super.key,
    required this.index,
    required this.focusNode,
    required this.returnClicked,
  });

  final int index;
  final FocusNode focusNode;
  final Function(int) returnClicked;

  @override
  State<ImportWordTextField24> createState() => _ImportWordTextFieldState24();
}

class _ImportWordTextFieldState24 extends State<ImportWordTextField24> {
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
      // if (suggestions.isNotEmpty && suggestions.contains(controller.text))
      //   return;

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
      elevation: 2,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        children: [
          for (final word in suggestions)
            ListTile(
              title: Text(word),
              onTap: () {
                context
                    .read<SeedImportCubit>()
                    .wordChanged24(widget.index, word, true);
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
      (SeedImportCubit cubit) =>
          cubit.state.words24.elementAtOrNull(widget.index),
    );

    if (word == null) return const SizedBox.shrink();
    if (controller.text != word.word) controller.text = word.word;

    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        height: 45,
        child: Row(
          children: [
            SizedBox(
              width: 28,
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
                  opacity: !word.tapped ? 0.5 : 1,
                  child: BBTextInput.small(
                    focusNode: widget.focusNode,
                    controller: controller,
                    onEnter: () {
                      context.read<SeedImportCubit>().clearUntappedWords();
                    },
                    onChanged: (value) {
                      context
                          .read<SeedImportCubit>()
                          .wordChanged24(widget.index, value, false);
                      hideOverlay();
                      setState(() {
                        tapped = false;
                      });
                    },
                    value: word.word,
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
