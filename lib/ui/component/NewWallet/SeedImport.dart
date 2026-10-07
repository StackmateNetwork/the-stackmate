import 'package:flutter/material.dart';
import 'package:sats/cubit/master.dart';
import 'package:sats/cubit/new-wallet/common/seed-import.dart';
import 'package:sats/cubit/new-wallet/common/words_cubit.dart';
import 'package:sats/cubit/new-wallet/from-old-seed.dart';
import 'package:sats/pkg/extensions.dart';
import 'package:sats/ui/component/NewWallet/SeedImport/Passphrase.dart';

class SeedImportSteps extends StatelessWidget {
  const SeedImportSteps({super.key});

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

/// Entry of the 12 or 24 recovery words of an existing wallet.
class SeedImportPhrase extends StatefulWidget {
  const SeedImportPhrase({super.key});

  @override
  State<SeedImportPhrase> createState() => _SeedImportPhraseState();
}

class _SeedImportPhraseState extends State<SeedImportPhrase> {
  static final _maxWords = supportedWordCounts.last;

  final _controllers = List.generate(_maxWords, (_) => TextEditingController());
  final _focusNodes = List.generate(_maxWords, (_) => FocusNode());
  int? _focused;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _maxWords; i++) {
      _focusNodes[i].addListener(() => _onFocusChanged(i));
    }
    _syncControllers(context.read<SeedImportCubit>().state.words);
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onFocusChanged(int index) {
    setState(() {
      if (_focusNodes[index].hasFocus) {
        _focused = index;
      } else if (_focused == index) {
        _focused = null;
      }
    });
  }

  void _syncControllers(List<String> words) {
    for (var i = 0; i < words.length; i++) {
      final controller = _controllers[i];
      if (controller.text != words[i]) {
        controller.value = TextEditingValue(
          text: words[i],
          selection: TextSelection.collapsed(offset: words[i].length),
        );
      }
    }
  }

  void _focusNext(int index, int wordCount) {
    if (index + 1 < wordCount) {
      _focusNodes[index + 1].requestFocus();
    } else {
      _focusNodes[index].unfocus();
    }
  }

  void _onChanged(int index, String value, int wordCount) {
    final cubit = context.read<SeedImportCubit>();
    cubit.wordChanged(index, value);
    // A space after a word moves on to the next field.
    if (value.endsWith(' ') &&
        value.trim().isNotEmpty &&
        !value.trim().contains(' ')) {
      _focusNext(index, wordCount);
    }
  }

  void _pickSuggestion(int index, String word, int wordCount) {
    context.read<SeedImportCubit>().wordChanged(index, word);
    _focusNext(index, wordCount);
  }

  Future<void> _recover(bool hasMaster) async {
    FocusScope.of(context).unfocus();
    final importCubit = context.read<SeedImportCubit>();
    if (hasMaster) {
      importCubit.gotoPassPhrase();
      return;
    }
    final walletCubit = context.read<SeedImportWalletCubit>();
    await importCubit.checkSeed();
    if (importCubit.state.seedReady) walletCubit.nextClicked();
  }

  @override
  Widget build(BuildContext c) {
    final hasMaster = c.select((MasterKeyCubit mk) => mk.state.key != null);
    final state = c.select((SeedImportCubit s) => s.state);
    final wordList = c.select((WordsCubit w) => w.state);
    final count = state.wordCount;
    final half = count ~/ 2;

    final focused = _focused;
    final suggestions = focused == null || focused >= count
        ? const <String>[]
        : wordList
              .findWords(state.words[focused])
              .where((w) => w != state.words[focused])
              .toList();

    Widget field(int i) => _SeedWordField(
      index: i,
      controller: _controllers[i],
      focusNode: _focusNodes[i],
      isInvalid: state.words[i].isNotEmpty && !wordList.isWord(state.words[i]),
      isLast: i == count - 1,
      onChanged: (v) => _onChanged(i, v, count),
      onSubmitted: () => _focusNext(i, count),
    );

    return BlocListener<SeedImportCubit, SeedImportState>(
      listenWhen: (a, b) => a.words != b.words,
      listener: (_, s) => _syncControllers(s.words),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: SegmentedButton<int>(
                    showSelectedIcon: false,
                    segments: [
                      for (final n in supportedWordCounts)
                        ButtonSegment(
                          value: n,
                          label: Text(
                            '$n words',
                            style: TextStyle(color: c.colours.onSurface),
                          ),
                        ),
                    ],
                    selected: {count},
                    onSelectionChanged: (s) =>
                        c.read<SeedImportCubit>().wordCountChanged(s.first),
                  ),
                ),
                IconButton(
                  tooltip: 'Clear',
                  icon: Icon(Icons.clear_all, color: c.colours.onSurface),
                  onPressed: () => c.read<SeedImportCubit>().clearWords(),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.content_paste),
                  label: const Text('PASTE'),
                  onPressed: () =>
                      c.read<SeedImportCubit>().pasteFromClipboard(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [for (var i = 0; i < half; i++) field(i)],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [for (var i = half; i < count; i++) field(i)],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48,
              child: suggestions.isEmpty
                  ? null
                  : ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (final word in suggestions)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ActionChip(
                              label: Text(word),
                              onPressed: () =>
                                  _pickSuggestion(focused!, word, count),
                            ),
                          ),
                      ],
                    ),
            ),
            if (state.seedError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  state.seedError,
                  textAlign: TextAlign.center,
                  style: c.fonts.bodySmall!.copyWith(color: c.colours.error),
                ),
              ),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: c.colours.surface,
                  backgroundColor: c.colours.primary,
                ),
                onPressed: state.seedValid ? () => _recover(hasMaster) : null,
                child: const Text('RECOVER WALLET'),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _SeedWordField extends StatelessWidget {
  const _SeedWordField({
    required this.index,
    required this.controller,
    required this.focusNode,
    required this.isInvalid,
    required this.isLast,
    required this.onChanged,
    required this.onSubmitted,
  });

  final int index;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isInvalid;
  final bool isLast;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext c) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      child: Row(
        children: [
          SizedBox(
            width: 26,
            child: Text(
              '${index + 1}',
              textAlign: TextAlign.right,
              style: c.fonts.bodySmall!.copyWith(color: c.colours.onSurface),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              onSubmitted: (_) => onSubmitted(),
              // Recovery words must never be learned or suggested by the
              // keyboard.
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: isLast
                  ? TextInputAction.done
                  : TextInputAction.next,
              style: c.fonts.bodyMedium!.copyWith(color: c.colours.onSurface),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                errorText: isInvalid ? '' : null,
                errorStyle: const TextStyle(height: 0, fontSize: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
