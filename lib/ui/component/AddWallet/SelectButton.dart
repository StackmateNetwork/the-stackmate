import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({
    super.key,
    required this.text,
    required this.description,
    required this.colour,
    required this.onPressed,
  });

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
        elevation: 0, backgroundColor: colour,
        // borderRadius: BorderRadius.circular(8),
        // shadowColor: Colors.,
        // color: colour,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
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
                  style: context.fonts.labelLarge!.copyWith(
                    color: context.colours.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 240,
                  // height: 45,
                  child: Text(
                    description,
                    maxLines: 4,
                    // softWrap: true,
                    // overflow: TextOverflow.fade,
                    style: context.fonts.bodySmall!.copyWith(
                      color: context.colours.primary,
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
