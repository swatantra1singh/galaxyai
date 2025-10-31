import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsSection(
            context,
            'Account',
            [
              _buildSettingsTile(
                context,
                'Profile',
                Icons.person_outline,
                () {},
              ),
              _buildSettingsTile(
                context,
                'Subscription',
                Icons.card_membership,
                () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            context,
            'Preferences',
            [
              _buildSettingsTile(
                context,
                'Notifications',
                Icons.notifications_outlined,
                () {},
              ),
              _buildSettingsTile(
                context,
                'Language',
                Icons.language,
                () {},
              ),
              _buildSettingsTile(
                context,
                'Dark Mode',
                Icons.dark_mode,
                () {},
                trailing: Switch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: AppTheme.primaryPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsSection(
            context,
            'Support',
            [
              _buildSettingsTile(
                context,
                'Help & Support',
                Icons.help_outline,
                () {},
              ),
              _buildSettingsTile(
                context,
                'Privacy Policy',
                Icons.privacy_tip_outlined,
                () {},
              ),
              _buildSettingsTile(
                context,
                'Terms of Service',
                Icons.description_outlined,
                () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildSettingsTile(
            context,
            'Logout',
            Icons.logout,
            () {},
            textColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppTheme.textSecondary,
                ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.cardBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsTile(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    Widget? trailing,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: textColor ?? AppTheme.textPrimary),
      title: Text(
        title,
        style: TextStyle(color: textColor ?? AppTheme.textPrimary),
      ),
      trailing: trailing ??
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppTheme.textSecondary,
          ),
      onTap: onTap,
    );
  }
}
