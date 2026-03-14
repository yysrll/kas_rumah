import 'package:flutter/material.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';

class KasCard extends StatelessWidget {
  final Widget child;
  const KasCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: context.theme.colorScheme.surfaceContainerLow,
      child: Padding(padding: const EdgeInsets.all(16.0), child: child),
    );
  }
}
