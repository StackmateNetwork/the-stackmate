import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    Key? key,
    required this.text,
    required this.description,
    required this.colour,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final String description;
  final Color colour;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        // borderRadius: BorderRadius.circular(8),
        // shadowColor: Colors.,
        // color: colour,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        primary: colour,
      ),
      child: Container(
        // height: 100,
        padding: const EdgeInsets.only(
          // left: 0,
          top: 24,
          bottom: 24,
          // right: 0,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text.toUpperCase(),
                  style: context.fonts.button!.copyWith(
                    color: context.colours.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 240,
                  // height: 45,
                  child: Text(
                    description,
                    maxLines: 3,
                    // softWrap: true,
                    // overflow: TextOverflow.fade,
                    style: context.fonts.caption!.copyWith(
                      color: context.colours.onSurface.withOpacity(0.7),
                      // fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next_sharp,
              size: 40,
              color: context.colours.primary,
            ),
          ],
        ),
      ),
    );
  }
}
