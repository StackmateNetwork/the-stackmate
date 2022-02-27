import 'package:flutter/material.dart';
import 'package:sats/ui/component/Calculator/Key.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  //static Widget _w = SizedBox(width: 4);
  static const Widget _h = SizedBox(height: 4);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: 'C'),
            //_w,
            CalcKey(text: 'del'),
            //_w,
            CalcKey(text: '1'),
            //_w,
            CalcKey(text: '2'),
            //_w,
            CalcKey(text: '3'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: '('),
            //_w,
            CalcKey(text: ')'),
            //_w,
            CalcKey(text: '4'),
            //_w,
            CalcKey(text: '5'),
            //_w,
            CalcKey(text: '6'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: '+'),
            //_w,
            CalcKey(text: '-'),
            //_w,
            CalcKey(text: '7'),
            //_w,
            CalcKey(text: '8'),
            //_w,
            CalcKey(text: '9'),
            //_w,
          ],
        ),
        _h,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            //_w,
            CalcKey(text: 'x'),
            //_w,
            CalcKey(text: '/'),
            //_w,
            CalcKey(text: '.'),
            //_w,
            CalcKey(text: '='),
            //_w,
            CalcKey(text: '0'),
            //_w,
          ],
        ),
        // SizedBox(height: 200)
      ],
    );
  }
}
