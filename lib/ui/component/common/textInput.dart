import 'package:flutter/material.dart';
import 'package:sats/pkg/extensions.dart';

enum _TextInputType {
  big,
  bigWithIcon,
  small,
  multiLine,
}

class BBTextInput extends StatefulWidget {
  const BBTextInput.multiLine({
    required this.onChanged,
    required this.value,
    this.rightIcon,
    this.onRightTap,
    this.disabled = false,
    this.focusNode,
    this.hint,
    this.controller,
  })  : type = _TextInputType.multiLine,
        onEnter = null;

  const BBTextInput.big({
    required this.onChanged,
    required this.value,
    this.disabled = false,
    this.focusNode,
    this.hint,
    this.controller,
  })  : type = _TextInputType.big,
        rightIcon = null,
        onRightTap = null,
        onEnter = null;

  const BBTextInput.bigWithIcon({
    required this.onChanged,
    required this.value,
    this.disabled = false,
    this.focusNode,
    required this.rightIcon,
    required this.onRightTap,
    this.hint,
    this.controller,
  })  : type = _TextInputType.bigWithIcon,
        onEnter = null;

  const BBTextInput.small({
    required this.onChanged,
    required this.value,
    this.disabled = false,
    this.focusNode,
    this.hint,
    this.controller,
    this.onEnter,
  })  : type = _TextInputType.small,
        rightIcon = null,
        onRightTap = null;

  final _TextInputType type;

  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final String value;
  final String? hint;
  final Widget? rightIcon;
  final VoidCallback? onRightTap;
  final bool disabled;
  final FocusNode? focusNode;
  final VoidCallback? onEnter;

  @override
  State<BBTextInput> createState() => _BBTextInputState();
}

class _BBTextInputState extends State<BBTextInput> {
  final _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.value != _editingController.text) {
      _editingController.text = widget.value;
    }

    Widget widgett;

    switch (widget.type) {
      case _TextInputType.multiLine:
        widgett = TextField(
          focusNode: widget.focusNode,
          enabled: !widget.disabled,
          onChanged: widget.onChanged,
          controller: _editingController,
          enableIMEPersonalizedLearning: false,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          style: context.fonts.bodySmall!
              .copyWith(color: context.colours.onSurface),
          decoration: InputDecoration(
            suffixIcon: widget.rightIcon,
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: BorderSide(
                color: context.colours.onSurface.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
              borderSide: BorderSide(
                color: context.colours.onSurface,
              ),
            ),
          ),
        );

      case _TextInputType.big:
        widgett = TextField(
          enabled: !widget.disabled,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          enableIMEPersonalizedLearning: false,
          controller: _editingController,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
              borderSide: BorderSide(
                color: context.colours.onSurface.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
              borderSide: BorderSide(
                color: context.colours.onSurface,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
              borderSide: BorderSide(
                color: context.colours.onSurface.withValues(alpha: 0.2),
              ),
            ),
            labelStyle: context.fonts.labelSmall,
            contentPadding: const EdgeInsets.only(bottom: 8, left: 24),
          ),
        );
      case _TextInputType.bigWithIcon:
        widgett = TextField(
          focusNode: widget.focusNode,
          enabled: !widget.disabled,
          onChanged: widget.onChanged,
          controller: _editingController,
          enableIMEPersonalizedLearning: false,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: IconButton(
              icon: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: widget.rightIcon,
              ),
              onPressed: widget.onRightTap,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
              borderSide: BorderSide(
                color: context.colours.onSurface.withValues(alpha: 0.2),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
              borderSide: BorderSide(
                color: context.colours.onSurface,
              ),
            ),
            labelStyle: context.fonts.labelSmall,
            contentPadding: const EdgeInsets.only(bottom: 8, left: 24),
          ),
        );
      case _TextInputType.small:
        widgett = SizedBox(
          height: 40,
          child: TextField(
            enableSuggestions: false,
            focusNode: widget.focusNode,
            enabled: !widget.disabled,
            onChanged: widget.onChanged,
            controller: _editingController,
            onTap: widget.onEnter,
            enableIMEPersonalizedLearning: false,
            decoration: InputDecoration(
              hintText: widget.hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80.0),
                borderSide: BorderSide(
                  color: context.colours.primary.withValues(alpha: 0.1),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80.0),
                borderSide: BorderSide(
                  color: context.colours.primary,
                ),
              ),
              labelStyle: context.fonts.labelSmall,
              contentPadding: const EdgeInsets.only(bottom: 8, left: 24),
            ),
          ),
        );
    }

    return widgett;
  }
}
