import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, outline, success, danger }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ButtonVariant variant;
  final bool isFullWidth;
  final double? width;
  final double height;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.isFullWidth = true,
    this.width,
    this.height = 52.0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    Color bg;
    Color fg;
    BorderSide border = BorderSide.none;

    switch (variant) {
      case ButtonVariant.primary:
        bg = colorScheme.primary;
        fg = Colors.white;
        break;
      case ButtonVariant.secondary:
        bg = colorScheme.surface;
        fg = colorScheme.onSurface;
        border = BorderSide(color: theme.dividerColor);
        break;
      case ButtonVariant.outline:
        bg = Colors.transparent;
        fg = colorScheme.primary;
        border = BorderSide(color: colorScheme.primary, width: 1.5);
        break;
      case ButtonVariant.success:
        bg = const Color(0xFF10B981);
        fg = Colors.white;
        break;
      case ButtonVariant.danger:
        bg = const Color(0xFFEF4444);
        fg = Colors.white;
        break;
    }

    final buttonChild = Row(
      mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: fg),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: fg,
              fontFamily: 'Urbanist',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );

    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          elevation: variant == ButtonVariant.outline ? 0 : 2,
          shadowColor: bg.withValues(alpha: 0.3),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: border,
          ),
        ),
        child: buttonChild,
      ),
    );
  }
}
