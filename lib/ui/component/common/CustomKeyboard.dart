import 'package:flutter/material.dart';

class CKController extends ChangeNotifier {
  String initialValue = '';

  void reset() {
    initialValue = '';
    notifyListeners();
  }
}

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    super.key,
    required this.backgroundColor,
    required this.bottomPaddingColor,
    required this.bottomPaddingHeight,
    required this.keyboardHeight,
    required this.keyboardWidth,
    required this.onChange,
    required this.onTapColor,
    required this.textColor,
    required this.keybordButtonColor,
    required this.elevation,
    required this.controller,
  });
  final double keyboardHeight;
  final double keyboardWidth;
  final Function(String) onChange;
  final Color backgroundColor;
  final Color onTapColor;
  final Color textColor;
  final Color bottomPaddingColor;
  final double bottomPaddingHeight;
  final Color keybordButtonColor;
  final MaterialStateProperty<double> elevation;
  final CKController controller;

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  // * current value of the keyboard
  late String inputValue = '';
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      print('listening to stuff.');
      setState(() {
        inputValue = widget.controller.initialValue;
      });
    });
  }

  // * this if shift is pressed
  bool isShiftPressed = false;

  // * this if caps is pressed
  bool isCapsPressed = false;

  // * if special character button is pressed
  bool isSpecialPressed = false;

  // * numbers which will be displayed on the top
  List<int> listOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  @override
  Widget build(BuildContext context) {
    // if (inputValue.isNotEmpty) {
    //   widget.controller.initialValue = inputValue;
    // }
    // inputValue = widget.controller.initialValue;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // * this is keyboard height
          height: widget.keyboardHeight,

          width: widget.keyboardWidth,
          // * keboard background color
          color: widget.backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // * number row
              SizedBox(
                height: widget.keyboardHeight * .13,
                width: widget.keyboardWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: listOfNumbers.map((e) {
                    return SizedBox(
                      width: widget.keyboardWidth * .08,
                      height: widget.keyboardHeight * .13,
                      child: TextButton(
                        onPressed: () {
                          inputValue += e.toString();
                          widget.onChange(inputValue);
                        },
                        style: ButtonStyle(
                          elevation: widget.elevation,
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.keybordButtonColor,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            widget.onTapColor,
                          ),
                        ),
                        child: Text(
                          e.toString(),
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.keyboardHeight * .06,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              if (isSpecialPressed)
                // * first special character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * +
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '+';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * X
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += 'X';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            'X',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ÷
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '÷';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '÷',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * =
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '=';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '=',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * /
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '/';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '/',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * _
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '_';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '_',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * €
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '€';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '€',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * £
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '£';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '£',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ¥
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '¥';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '¥',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ₩
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '₩';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '₩',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (!isSpecialPressed)
                // * first character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * q
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'Q';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'q';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'Q' : 'q',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * w
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'W';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'w';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'W' : 'w',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * e
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'E';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'e';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'E' : 'e',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * r
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'R';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'r';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'R' : 'r',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * t
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'T';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 't';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'T' : 't',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * y
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'Y';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'y';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'Y' : 'y',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * u
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'U';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'u';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'U' : 'u',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * i
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'I';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'i';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'I' : 'i',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * o
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'O';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'o';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'O' : 'o',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * p
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'P';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'p';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'P' : 'p',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (isSpecialPressed)
                // * first special character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * !
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '!';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '!',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * @
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '@';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '@',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * #
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '#';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '#',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * $
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '\$';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '\$',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * %
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '%';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '%',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ^
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '^';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '^',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * &
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '&';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '&',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * *
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '*';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * (
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '(';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '(',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * )
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += ')';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            ')',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              if (!isSpecialPressed)
                // * second character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * left space
                      SizedBox(
                        width: widget.keyboardWidth * .02,
                      ),
                      // * a
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'A';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'a';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'A' : 'a',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * s
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'S';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 's';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'S' : 's',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * d
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'D';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'd';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'D' : 'd',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * f
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'F';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'f';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'F' : 'f',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * g
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'G';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'g';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'G' : 'g',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * h
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'H';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'h';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'H' : 'h',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * j
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'J';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'j';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'J' : 'j',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * k
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'K';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'k';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'K' : 'k',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * l
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'L';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'l';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'L' : 'l',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * right space
                      SizedBox(
                        width: widget.keyboardWidth * .02,
                      ),
                    ],
                  ),
                ),

              if (isSpecialPressed)
                // * first special character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * spacer
                      const SizedBox(),
                      // * -
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '-';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '-',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * '
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += "'";
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            "'",
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * "
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '"';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '"',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * :
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += ':';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            ':',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ;
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += ';';
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            ';',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * ?
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '?';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '?',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * &
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '&';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '&',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * *
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            inputValue += '*';

                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * spacer
                      const SizedBox(),
                    ],
                  ),
                ),

              if (!isSpecialPressed)
                // * third character row
                SizedBox(
                  height: widget.keyboardHeight * .17,
                  width: widget.keyboardWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // * shift
                      InkWell(
                        onDoubleTap: () {
                          setState(() {
                            isCapsPressed = true;
                          });
                        },
                        splashColor: widget.onTapColor,
                        onTap: () {
                          if (isCapsPressed) {
                            setState(() {
                              isCapsPressed = false;
                            });
                          } else {
                            setState(() {
                              isShiftPressed = !isShiftPressed;
                            });
                          }
                        },
                        child: Container(
                          width: widget.keyboardWidth * .11,
                          height: widget.keyboardHeight * .17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.keybordButtonColor,
                          ),
                          child: (isShiftPressed || isCapsPressed)
                              ? Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: widget.onTapColor,
                                )
                              : Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: widget.textColor,
                                ),
                        ),
                      ),
                      // * z
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'Z';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'z';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'Z' : 'z',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * x
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'X';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'x';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'X' : 'x',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * c
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'C';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'c';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'C' : 'c',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * v
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'V';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'v';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'V' : 'v',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * b
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'B';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'b';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'B' : 'b',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * n
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'N';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'n';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'N' : 'n',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * m
                      SizedBox(
                        width: widget.keyboardWidth * .08,
                        height: widget.keyboardHeight * .17,
                        child: TextButton(
                          onPressed: () {
                            if (isShiftPressed || isCapsPressed) {
                              inputValue += 'M';
                              if (isShiftPressed) {
                                setState(() {
                                  isShiftPressed = false;
                                });
                              }
                            } else {
                              inputValue += 'm';
                            }
                            widget.onChange(inputValue);
                          },
                          style: ButtonStyle(
                            elevation: widget.elevation,
                            backgroundColor: MaterialStateProperty.all<Color>(
                              widget.keybordButtonColor,
                            ),
                            overlayColor: MaterialStateProperty.all<Color>(
                              widget.onTapColor,
                            ),
                          ),
                          child: Text(
                            (isShiftPressed || isCapsPressed) ? 'M' : 'm',
                            style: TextStyle(
                              color: widget.textColor,
                              fontSize: widget.keyboardHeight * .08,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      // * delete
                      InkWell(
                        onTap: () {
                          if (inputValue.isNotEmpty) {
                            inputValue =
                                inputValue.substring(0, inputValue.length - 1);
                            widget.onChange(inputValue);
                          }
                        },
                        splashColor: widget.onTapColor,
                        child: Container(
                          width: widget.keyboardWidth * .11,
                          height: widget.keyboardHeight * .17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: widget.keybordButtonColor,
                          ),
                          child: Icon(
                            Icons.backspace_rounded,
                            color: widget.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // * last row
              SizedBox(
                height: widget.keyboardHeight * .17,
                width: widget.keyboardWidth,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // * show special
                    InkWell(
                      splashColor: widget.onTapColor,
                      onTap: () {
                        setState(() {
                          isSpecialPressed = !isSpecialPressed;
                        });
                      },
                      child: Container(
                        width: widget.keyboardWidth * .15,
                        height: widget.keyboardHeight * .17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: widget.keybordButtonColor,
                        ),
                        child: isSpecialPressed
                            ? Icon(
                                Icons.language_rounded,
                                color: widget.onTapColor,
                              )
                            : Icon(
                                Icons.language_rounded,
                                color: widget.textColor,
                              ),
                      ),
                    ),
                    // * ,
                    SizedBox(
                      width: widget.keyboardWidth * .08,
                      height: widget.keyboardHeight * .17,
                      child: TextButton(
                        onPressed: () {
                          if (isShiftPressed || isCapsPressed) {
                            inputValue += ',';
                            if (isShiftPressed) {
                              setState(() {
                                isShiftPressed = false;
                              });
                            }
                          } else {
                            inputValue += ',';
                          }
                          widget.onChange(inputValue);
                        },
                        style: ButtonStyle(
                          elevation: widget.elevation,
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.keybordButtonColor,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            widget.onTapColor,
                          ),
                        ),
                        child: Text(
                          ',',
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.keyboardHeight * .08,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // * space
                    SizedBox(
                      width: widget.keyboardWidth * .4,
                      height: widget.keyboardHeight * .17,
                      child: TextButton(
                        onPressed: () {
                          if (isShiftPressed || isCapsPressed) {
                            inputValue += ' ';
                            if (isShiftPressed) {
                              setState(() {
                                isShiftPressed = false;
                              });
                            }
                          } else {
                            inputValue += ' ';
                          }
                          widget.onChange(inputValue);
                        },
                        style: ButtonStyle(
                          elevation: widget.elevation,
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.keybordButtonColor,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            widget.onTapColor,
                          ),
                        ),
                        child: Text(
                          'space',
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.keyboardHeight * .08,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    // * .
                    SizedBox(
                      width: widget.keyboardWidth * .08,
                      height: widget.keyboardHeight * .17,
                      child: TextButton(
                        onPressed: () {
                          if (isShiftPressed || isCapsPressed) {
                            inputValue += '.';
                            if (isShiftPressed) {
                              setState(() {
                                isShiftPressed = false;
                              });
                            }
                          } else {
                            inputValue += '.';
                          }
                          widget.onChange(inputValue);
                        },
                        style: ButtonStyle(
                          elevation: widget.elevation,
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.keybordButtonColor,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            widget.onTapColor,
                          ),
                        ),
                        child: Text(
                          '.',
                          style: TextStyle(
                            color: widget.textColor,
                            fontSize: widget.keyboardHeight * .08,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // * enter
                    SizedBox(
                      width: widget.keyboardWidth * .15,
                      height: widget.keyboardHeight * .17,
                      child: TextButton(
                        onPressed: () {
                          inputValue += '\n';
                          widget.onChange(inputValue);
                        },
                        style: ButtonStyle(
                          elevation: widget.elevation,
                          backgroundColor: MaterialStateProperty.all<Color>(
                            widget.keybordButtonColor,
                          ),
                          overlayColor: MaterialStateProperty.all<Color>(
                            widget.onTapColor,
                          ),
                        ),
                        child: RotationTransition(
                          turns: const AlwaysStoppedAnimation(180 / 360),
                          child: Icon(
                            Icons.shortcut_rounded,
                            color: widget.textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // * bottom padding
        Container(
          height: widget.bottomPaddingHeight,
          width: widget.keyboardWidth,
          // * bottom padding color
          color: widget.bottomPaddingColor,
        ),
      ],
    );
  }
}
