import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  final int index;
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const OptionCard({
    super.key,
    required this.index,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  String get optionLetter {
    const letters = ['A', 'B', 'C', 'D', 'E', 'F'];
    if (index >= 0 && index < letters.length) {
      return letters[index];
    }
    return '${index + 1}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final borderColor = isSelected
        ? colorScheme.primary
        : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0));

    final backgroundColor = isSelected
        ? colorScheme.primary.withValues(alpha: 0.12)
        : colorScheme.surface;

    final badgeBg = isSelected
        ? colorScheme.primary
        : (isDark ? const Color(0xFF334155) : const Color(0xFFF1F5F9));

    final badgeFg = isSelected ? Colors.white : colorScheme.onSurface;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: borderColor,
                width: isSelected ? 2.0 : 1.2,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Option letter badge (A, B, C, D)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: badgeBg,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    optionLetter,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: badgeFg,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                // Option text
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 15,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: colorScheme.onSurface,
                      height: 1.35,
                    ),
                  ),
                ),
                if (isSelected) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.check_circle_rounded,
                    color: colorScheme.primary,
                    size: 22,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
