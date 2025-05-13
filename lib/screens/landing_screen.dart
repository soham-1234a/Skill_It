import 'package:flutter/material.dart';
import '../models/user_model.dart';
// The project architect specified a 'user_info_view.dart' widget.
// Assuming it will be in 'lib/widgets/user_info_view.dart'
import '../widgets/user_info_view.dart'; 
import 'package:url_launcher/url_launcher.dart';


class LandingScreen extends StatelessWidget {
  // This screen might receive user data if the "LOGOUT" or "APPLY" action
  // needs to display specific information (e.g., "Application submitted for John Doe").
  // For now, let's assume it might receive a generic user or displays generic info.
  final UserModel? user; // User logged out or whose application was submitted

  const LandingScreen({super.key, this.user});

  // A mock user for display if no specific user data is passed
  static const UserModel _defaultUser = UserModel(
    id: 'defaultUserLanding',
    name: 'Skill It User',
    contact: 'N/A', // Not typically shown on a generic landing page
    email: 'contact@skillit.app', // Generic contact email
    skills: [], // Not typically shown on a generic landing page
  );

  Future<void> _launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      queryParameters: {
        'subject': 'Inquiry from Skill It App'
      }
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      // Handle the error or show a message to the user
      // For example, using a SnackBar:
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Could not launch email app for $emailAddress')),
      // );
      debugPrint('Could not launch $emailLaunchUri');
    }
  }


  @override
  Widget build(BuildContext context) {
    final displayUser = user ?? _defaultUser;
    // Determine a message based on context (e.g. if navigated from apply or logout)
    final String message;
    final ModalRoute<dynamic>? route = ModalRoute.of(context);
    if (route?.settings.name == '/landing_after_apply') {
        message = 'Your application has been submitted!';
    } else if (route?.settings.name == '/landing_after_logout') {
        message = 'You have been successfully logged out.';
    } else {
        message = 'Welcome to Skill It!';
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Skill It'),
        automaticallyImplyLeading: false, // No back button on landing page
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle_outline, // Or a relevant app logo
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 24.0),
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16.0),
              // The description says "Shows user info and an email icon."
              // UserInfoView might be too detailed here. Let's display a simpler version.
              Text(
                'User: ${displayUser.name}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Contact: ${displayUser.email}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  IconButton(
                    icon: Icon(Icons.email_outlined, color: Theme.of(context).colorScheme.secondary),
                    tooltip: 'Send Email',
                    onPressed: () => _launchEmail(displayUser.email),
                  ),
                ],
              ),
              const SizedBox(height: 48.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the main app screen, assuming it's '/main_nav'
                  // or the initial route for authenticated users.
                  // This behavior depends on the app's auth flow.
                  // For now, let's assume it navigates to a login or home if no auth.
                  // As per description, landing page is a terminal state after logout/apply.
                  // Perhaps this button should take them to an "initial" screen like login
                  // if one exists, or simply stay. For now, no action or a dummy action.
                  // To make it runnable and not dead-end, let's navigate to '/home' (MainNavigationScreen)
                  Navigator.of(context).pushNamedAndRemoveUntil('/main_nav', (Route<dynamic> route) => false);

                },
                child: const Text('Return to App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}