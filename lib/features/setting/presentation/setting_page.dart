import 'package:flutter/material.dart';
import 'package:kas_rumah/components/layouts/app_scaffold.dart';
import 'package:kas_rumah/core/utils/context/context_ext.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return AppScaffold(
      appBar: AppBar(title: Text(context.strings.settingsTitle)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Profile Summary Section
            _buildProfileSummary(theme),

            const SizedBox(height: 32),
            Text("Akun & Buku Kas", style: theme.textTheme.muted),
            const SizedBox(height: 12),

            // 2. Back to Workspace List
            ShadCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  _buildSettingItem(
                    theme,
                    icon: LucideIcons.layers,
                    title: "Ganti Buku Kas",
                    subtitle: "Kembali ke daftar semua buku kas",
                    onTap: () {
                      // Logic kembali ke Workspace List
                    },
                  ),
                  Divider(height: 1, color: theme.colorScheme.border),
                  _buildSettingItem(
                    theme,
                    icon: LucideIcons.userPlus,
                    title: "Undang Keluarga",
                    subtitle: "Tambah anggota ke buku kas ini",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // 3. Logout Button
            ShadButton.destructive(
              width: double.infinity,
              leading: const Icon(LucideIcons.logOut, size: 18),
              onPressed: () => _showLogoutDialog(context),
              child: const Text("Keluar"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSummary(ShadThemeData theme) {
    return Row(
      children: [
        // Avatar Placeholder ala Shadcn
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: theme.colorScheme.primary, width: 2),
          ),
          child: Center(
            child: Text(
              "AD", // Inisial user
              style: theme.textTheme.h3.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Abi Dzazar", style: theme.textTheme.h4),
            Text("abi@keluarga.com", style: theme.textTheme.muted),
            const SizedBox(height: 4),
            ShadBadge.secondary(child: const Text("Admin Keluarga")),
          ],
        ),
      ],
    );
  }

  Widget _buildSettingItem(
    ShadThemeData theme, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 20, color: theme.colorScheme.foreground),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: theme.textTheme.muted.copyWith(fontSize: 12),
                  ),
                ],
              ),
            ),
            Icon(
              LucideIcons.chevronRight,
              size: 16,
              color: theme.colorScheme.muted,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showShadDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: const Text("Konfirmasi Keluar"),
        description: const Text(
          "Apakah kamu yakin ingin keluar dari Kas Rumah?",
        ),
        actions: [
          ShadButton.ghost(
            child: const Text("Batal"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ShadButton.destructive(
            child: const Text("Ya, Keluar"),
            onPressed: () {
              // Logic Logout Supabase
            },
          ),
        ],
      ),
    );
  }
}
