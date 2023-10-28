import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Language {
  EN,
  FR,
  DE,
  AR,
}

enum Layout {
  QWERTY,
  QWERTZ,
  AZERTY,
  ARABIC,
}

var languageConfig = {
  Language.EN: englishConfig,
  Language.FR: frenchConfig,
  Language.DE: germanConfig,
  Language.AR: arabicConfig,
};

// Languages Configurations

var englishConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopasdfghjklyxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var frenchConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopasdfghjklzxcvbnm',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
  Layout.AZERTY: <String, String>{
    'layout': 'azertyuiopqsdfghjklmwxcvbn',
    'horizontalSpacing': '6.0',
    'topLength': '10',
    'middleLength': '9',
  },
};

var germanConfig = {
  Layout.QWERTY: <String, String>{
    'layout': 'qwertyuiopüasdfghjklöäzxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
  Layout.QWERTZ: <String, String>{
    'layout': 'qwertzuiopüasdfghjklöäyxcvbnmß',
    'horizontalSpacing': '2.5',
    'topLength': '11',
    'middleLength': '11',
  },
};

var arabicConfig = {
  Layout.ARABIC: <String, String>{
    'layout': 'ثةورزدذطظكمنتالبيسشجحخهعغفقصض',
    'horizontalSpacing': '2.8',
    'topLength': '11',
    'middleLength': '10',
  },
};

// class Suggestion<T> {
//   Suggestion({required this.title, required this.value});
//   final String title;
//   final T value;
// }

// typedef OnTap<T> = Function(T value);

// class KeyboardSuggestionsView<T> extends StatelessWidget {
//   const KeyboardSuggestionsView({
//     required this.suggestions,
//     required this.onTap,
//     required this.backgroundColor,
//     required this.textStyle,
//     this.numberResultsPerScreen = 3,
//   });
//   final List<Suggestion<T>> suggestions;
//   final OnTap<T> onTap;
//   final Color backgroundColor;
//   final TextStyle textStyle;
//   final int numberResultsPerScreen;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60,
//       color: backgroundColor,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: suggestions.length,
//         separatorBuilder: (c, i) => const VerticalDivider(),
//         itemBuilder: (c, i) {
//           return Container(
//             width: suggestions.length > numberResultsPerScreen
//                 ? (MediaQuery.of(context).size.width - 100) /
//                     numberResultsPerScreen
//                 : (MediaQuery.of(context).size.width - 30) /
//                     numberResultsPerScreen,
//             child: TextButton(
//               onPressed: () {
//                 onTap(suggestions[i].value);
//               },
//               child: Center(
//                 child: Text(
//                   suggestions[i].title,
//                   style: textStyle,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class BuiltInKeyboard extends StatefulWidget {
  const BuiltInKeyboard({
    super.key,
    required this.controller,
    this.language = Language.EN,
    this.layout = Layout.QWERTY,
    this.height,
    this.width,
    this.spacing = 8.0,
    this.borderRadius,
    this.color = Colors.deepOrange,
    this.letterStyle = const TextStyle(fontSize: 25, color: Colors.black),
    this.enableSpaceBar = false,
    this.enableBackSpace = true,
    this.enableCapsLock = false,
    this.enableAllUppercase = false,
    this.enableLongPressUppercase = false,
    this.highlightColor,
    this.splashColor,
  });
  // Language of the keyboard
  final Language language;

  // layout of the keyboard
  final Layout layout;

  // The controller connected to the InputField
  final TextEditingController? controller;

  // Vertical spacing between key rows
  final double spacing;

  // Border radius of the keys
  final BorderRadius? borderRadius;

  // Color of the keys
  final Color color;

  // TextStyle of the letters in the keys (fontsize, fontface)
  final TextStyle letterStyle;

  // the additional key that can be added to the keyboard
  final bool enableSpaceBar;
  final bool enableBackSpace;
  final bool enableCapsLock;

  // height and width of each key
  final double? height;
  final double? width;

  // Additional functionality for the keys //

  // Makes the keyboard uppercase
  final bool enableAllUppercase;

  // Long press to write uppercase letters
  final bool enableLongPressUppercase;

  // The color displayed when the key is pressed
  final Color? highlightColor;
  final Color? splashColor;

  @override
  State<BuiltInKeyboard> createState() => _BuiltInKeyboardState();
}

class _BuiltInKeyboardState extends State<BuiltInKeyboard> {
  double? height;
  double? width;
  bool capsLockUppercase = false;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    height = screenHeight > 800 ? screenHeight * 0.059 : screenHeight * 0.07;
    width = screenWidth > 350 ? screenWidth * 0.084 : screenWidth * 0.082;
    final keyboardLayout = layout();
    double hspacing;
    int topLen;
    int midLen;
    try {
      hspacing = double.parse(
        languageConfig[widget.language]![widget.layout]!['horizontalSpacing']!,
      );
      topLen = int.parse(
        languageConfig[widget.language]![widget.layout]!['topLength']!,
      );
      midLen = int.parse(
        languageConfig[widget.language]![widget.layout]!['middleLength']!,
      );
    } catch (e) {
      printError(
        'Uknown language or layout was used, or Incorrect combination of language-layout',
      );
      exit(0);
    }
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: hspacing,
          runSpacing: 5,
          children: keyboardLayout.sublist(0, topLen),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: hspacing,
          runSpacing: 5,
          children: keyboardLayout.sublist(topLen, topLen + midLen),
        ),
        SizedBox(
          height: widget.spacing,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.enableCapsLock)
              capsLock()
            else
              SizedBox(
                width: widget.width ?? width!,
              ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: hspacing,
              runSpacing: 5,
              children: keyboardLayout.sublist(topLen + midLen),
            ),
            if (widget.enableBackSpace)
              backSpace()
            else
              SizedBox(
                width: (widget.width ?? width)! + 10,
              ),
          ],
        ),
        if (widget.enableSpaceBar)
          Column(
            children: [
              SizedBox(
                height: widget.spacing,
              ),
              spaceBar(),
            ],
          )
        else
          const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        // keyboardSuggestion(),
      ],
    );
  }

// //keyboard word suggestion
//   Widget keyboardSuggestion() {
//     return Container(
//       height: 40,
//       color: widget.color,
//       width: MediaQuery.of(context).size.width,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: widget.suggestions.length,
//         separatorBuilder: (BuildContext context, int index) =>
//             const VerticalDivider(),
//         itemBuilder: (BuildContext context, int i) {
//           return Container(
//             width: widget.suggestions.length > widget.numberResultsPerScreen
//                 ? (MediaQuery.of(context).size.width - 100) /
//                     widget.numberResultsPerScreen
//                 : (MediaQuery.of(context).size.width - 30) /
//                     widget.numberResultsPerScreen,
//             child: TextButton(
//               onPressed: () {
//                 widget.onTap(widget.suggestions[i].value);
//               },
//               child: Center(
//                 child: Text(
//                   widget.suggestions[i].title,
//                   style: widget.textStyle,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

  // Letter button widget
  Widget buttonLetter(String letter) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: widget.width ?? width,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              widget.controller?.text += letter;
              widget.controller?.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length),
              );
            },
            onLongPress: () {
              if (widget.enableLongPressUppercase &&
                  !widget.enableAllUppercase) {
                widget.controller?.text += letter.toUpperCase();
                widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length),
                );
              }
            },
            child: Center(
              child: Text(
                letter,
                style: widget.letterStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Spacebar button widget
  Widget spaceBar() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 150,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              widget.controller?.text += ' ';
              widget.controller?.selection = TextSelection.fromPosition(
                TextPosition(offset: widget.controller!.text.length),
              );
            },
            child: Center(
              child: Text(
                '',
                style: TextStyle(
                  fontSize: widget.letterStyle.fontSize,
                  color: widget.letterStyle.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Backspace button widget
  Widget backSpace() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              if (widget.controller!.text.isNotEmpty) {
                widget.controller?.text = widget.controller!.text
                    .substring(0, widget.controller!.text.length - 1);
                widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length),
                );
              }
            },
            onLongPress: () {
              if (widget.controller!.text.isNotEmpty) {
                widget.controller?.text = '';
                widget.controller?.selection = TextSelection.fromPosition(
                  TextPosition(offset: widget.controller!.text.length),
                );
              }
            },
            child: Center(
              child: Icon(
                Icons.backspace,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Capslock button widget
  Widget capsLock() {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      child: Container(
        height: widget.height ?? height,
        width: (widget.width ?? width)! + 20,
        child: Material(
          type: MaterialType.button,
          color: widget.color,
          child: InkWell(
            highlightColor: widget.highlightColor,
            splashColor: widget.splashColor,
            onTap: () {
              HapticFeedback.heavyImpact();
              setState(() {
                capsLockUppercase = !capsLockUppercase;
              });
            },
            child: Center(
              child: Icon(
                Icons.keyboard_capslock,
                size: widget.letterStyle.fontSize,
                color: widget.letterStyle.color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Keyboard layout list
  List<Widget> layout() {
    List<String> letters = [];
    try {
      letters =
          languageConfig[widget.language]![widget.layout]!['layout']!.split('');
    } catch (e) {
      printError(
        'Uknown language or layout was used, or Incorrect combination of language-layout',
      );
      exit(0);
    }

    final List<Widget> keyboard = [];
    for (final letter in letters) {
      keyboard.add(
        buttonLetter(letter),
      );
    }
    return keyboard;
  }
}

void printError(String text) {
  print('\x1B[31m$text\x1B[0m');
}
