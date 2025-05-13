import 'package:flutter/material.dart';
import '../models/user_model.dart';
// The project architect specified a 'user_info_view.dart' widget.
// Assuming it will be in 'lib/widgets/user_info_view.dart'
import '../widgets/user_info_view.dart';
import 'landing_screen.dart'; // For navigation on logout

class ProfileScreen extends StatelessWidget {
  final UserModel user;

  const ProfileScreen({super.key, required this.user});

  void _logout(BuildContext context) {
    // Navigate to Landing Page and remove all previous routes
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/landing_after_logout', // Specific route name for context in LandingScreen
      (Route<dynamic> route) => false,
      arguments: user // Pass user data if LandingScreen needs it for a "Logged out X" message
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        // Back button will be automatically added by Flutter's navigation
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.colorScheme.surfaceVariant,
              backgroundImage: user.profilePictureUrl != null && user.profilePictureUrl!.isNotEmpty
                  ? NetworkImage(user.profilePictureUrl!)
                  : null, // Use NetworkImage if URL is available
              child: user.profilePictureUrl == null || user.profilePictureUrl!.isEmpty
                  ? Icon(
                      Icons.person,
                      size: 60,
                      color: theme.colorScheme.onSurfaceVariant,
                    ) // Fallback icon
                  : null,
            ),
            const SizedBox(height: 16.0),
            Text(
              user.name,
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24.0),
            // Use the reusable UserInfoView widget to display details.
            // This widget will handle name, contact, email, skills.
            UserInfoView(
              name: user.name, // UserInfoView also takes name, which is fine, could be omitted here if redundant
              contact: user.contact,
              email: user.email,
              skills: user.skills,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('LOGOUT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.error,
                foregroundColor: theme.colorScheme.onError,
                minimumSize: const Size(double.infinity, 50), // Full width button
              ),
              onPressed: () => _logout(context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}