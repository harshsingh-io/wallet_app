// ignore_for_file: unused_import

import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart'
    as widget_book;

enum SAButtonColor {
  primary(Color.fromARGB(255, 240, 74, 71)),
  secondary(Color.fromARGB(255, 95, 95, 95)),
  white(Colors.white);

  final Color color;

  const SAButtonColor(this.color);
}

class SAButton extends StatelessWidget {
  // const SAButton({
  //   super.key,
  //   this.label,
  //   this.icon,
  //   this.color = SAButtonColor.primary,
  //   this.onPressed,
  // })  : _primary = true,
  //       assert(
  //           label != null || icon != null, 'Label or icon must be provided.');
  // // Use asserts to enforce rules which cannot be done at compile time

  const SAButton.primary({
    super.key,
    required this.label,
    this.icon,
    this.color = SAButtonColor.primary,
    this.onPressed,
    this.isLoading = false,
  })  : _primary = true,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );

  const SAButton.secondary({
    required this.label,
    super.key,
    this.icon,
    this.color = SAButtonColor.primary,
    this.onPressed,
    this.isLoading = false,
  })  : _primary = false,
        assert(
          label != null || icon != null,
          'Label or icon must be provided.',
        );
  final String? label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final SAButtonColor color;
  final bool _primary;
  final bool isLoading;

  Widget _buildLoading(BuildContext context, SAButtonColor color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      // Icon, icon + text, and text-only possibilities are abstracted in MyButton
      children: [
        if (icon != null) Icon(icon, size: 12),
        if (icon != null && label != null) const SizedBox(width: 12),
        if (isLoading)
          LoadingAnimationWidget.prograssiveDots(
            color: color.color,
            size: 12,
          ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, SAButtonColor color) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 32,
        right: 32,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        // Icon, icon + text, and text-only possibilities are abstracted in MyButton
        children: [
          if (icon != null) Icon(icon, size: 12),
          if (icon != null && label != null) const SizedBox(width: 12),
          if (label != null)
            Text(
              label!,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const buttonPadding = EdgeInsets.symmetric(
      vertical: 3,
      horizontal: 16, // Adjusted to allow for more padding on the sides
    );

    // Full-width button configuration
    Widget buttonChild = isLoading
        ? _buildLoading(context, color)
        : _buildButton(context, color);

    if (!kIsWeb && Platform.isIOS) {
      final themeData = CupertinoTheme.of(context);

      if (_primary) {
        final button = CupertinoButton.filled(
          padding: buttonPadding,
          onPressed: onPressed,
          child: buttonChild,
        );

        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color.color),
          child: button,
        );
      } else {
        return CupertinoTheme(
          data: themeData.copyWith(primaryColor: color.color),
          child: CupertinoButton(
            padding: buttonPadding,
            onPressed: onPressed,
            child: buttonChild,
          ),
        );
      }
    }

    if (_primary) {
      return SizedBox(
        width: double.infinity, // Ensure it takes the full width
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color.color,
            padding: buttonPadding,
          ),
          onPressed: isLoading ? () {} : onPressed,
          child: buttonChild,
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity, // Ensure it takes the full width
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: buttonPadding,
            foregroundColor: color.color,
            side: BorderSide(color: color.color),
          ),
          onPressed: isLoading ? () {} : onPressed,
          child: buttonChild,
        ),
      );
    }
  }
}
