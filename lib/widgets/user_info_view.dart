import 'package:flutter/material.dart';

class UserInfoView extends StatelessWidget {
  final String name;
  final String contact;
  final String email;
  final List<String> skills;

  const UserInfoView({
    super.key,
    required this.name,
    required this.contact,
    required this.email,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      elevation: 2, // Use CardTheme elevation from AppTheme
      // margin: EdgeInsets.zero, // Or specific margin if needed
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Name is often displayed more prominently above this widget (e.g., in ProfileScreen)
            // If it needs to be part of this reusable view, it can be added here.
            // For now, assuming name might be handled by the parent screen if it needs special styling.
            // Text(name, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            // const SizedBox(height: 12.0),

            _InfoRow(
              icon: Icons.phone_outlined,
              label: 'Contact',
              value: contact,
              textTheme: textTheme,
            ),
            const Divider(),
            _InfoRow(
              icon: Icons.email_outlined,
              label: 'Email',
              value: email,
              textTheme: textTheme,
            ),
            const Divider(),
            _SkillsSection(skills: skills, textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final TextTheme textTheme;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(icon, size: 20.0, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 2.0),
                Text(value, style: textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  final List<String> skills;
  final TextTheme textTheme;

  const _SkillsSection({
    required this.skills,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.star_border_outlined, size: 20.0, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 16.0),
              Text('Skills', style: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8.0),
          if (skills.isEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 36.0), // Align with icon spacing
              child: Text('No skills listed.', style: textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic)),
            )
          else
            Padding(
              padding: const EdgeInsets.only(left: 36.0), // Align with icon spacing
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: skills.map((skill) => Chip(
                  label: Text(skill),
                  // backgroundColor: Theme.of(context).chipTheme.backgroundColor,
                  // labelStyle: Theme.of(context).chipTheme.labelStyle,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                )).toList(),
              ),
            ),
        ],
      ),
    );
  }
}