import 'package:flutter/material.dart';
import 'package:flutty_solar_icons/solar_icons_flutter.dart';
import 'package:kas_rumah/components/icon/app_solar_icon.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class TransactionOverviewItem extends StatelessWidget {
  const TransactionOverviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 16,
        children: [
          AppSolarIcon(SolarIcons.HomeSmile),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: Text('Sewa Apart', style: context.textTheme.titleMedium),
                    ),
                    Text(
                      '-IDR 500K',
                      style: context.textTheme.labelSmall?.copyWith(
                        fontSize: 12,
                        color: Colors.red.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Sewa Apart bulan Maret 2026',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '1 Maret 2026',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
