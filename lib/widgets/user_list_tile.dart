import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserListTile extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onTap;

  const UserListTile({
    super.key,
    required this.user,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    String skillsSummary = user.skills.take(3).join(', ');
    if (user.skills.length > 3) {
      skillsSummary += ', ...';
    }
    if (user.skills.isEmpty) {
      skillsSummary = 'No skills listed';
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      child: InkWell(
        onTap: onTap,
        splashColor: colorScheme.primary.withOpacity(0.1),
        highlightColor: colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.0), // Matches CardTheme's default if set
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 28,
                backgroundColor: colorScheme.surfaceVariant,
                backgroundImage: user.profilePictureUrl != null && user.profilePictureUrl!.isNotEmpty
                    ? NetworkImage(user.profilePictureUrl!)
                    : null,
                child: user.profilePictureUrl == null || user.profilePictureUrl!.isEmpty
                    ? Icon(
                        Icons.person_outline,
                        size: 28,
                        color: colorScheme.onSurfaceVariant,
                      )
                    : null,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      user.name,
                      style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      skillsSummary,
                      style: textTheme.bodyMedium?.copyWith(color: textTheme.bodyMedium?.color?.withOpacity(0.8)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              if (onTap != null) // Show chevron only if it's tappable
                Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
            ],
          ),
        ),
      ),
    );
  }
}