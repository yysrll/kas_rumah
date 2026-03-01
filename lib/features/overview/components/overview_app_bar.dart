import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/constant/dimen_constant.dart';
import 'package:kas_rumah/core/utils/context/shad_context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.shadTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultScreenPadding,
        vertical: 12,
      ),
      child: Row(
        spacing: 16,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: theme.radius,
              color: theme.colorScheme.primary.withValues(alpha: 0.2),
            ),
            child: Icon(
              Icons.account_circle,
              size: 24,
              color: theme.colorScheme.primary,
            ),
          ),
          Expanded(child: Text('Hi, Yusril', style: theme.textTheme.lead)),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: theme.radius,
              color: theme.colorScheme.accent,
            ),
            child: Icon(
              LucideIcons.bolt,
              size: 24,
              color: theme.colorScheme.accentForeground,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
