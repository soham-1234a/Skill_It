import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'models/user_model.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/apply_screen.dart';
import 'screens/home_screen.dart'; // For the '/home' route specifically from ApplyScreen cancel

void main() {
  runApp(const SkillItApp());
}

class SkillItApp extends StatelessWidget {
  const SkillItApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For ProfileScreen, a mock user for direct navigation demonstration if needed.
    // In a real app, this would come from auth or state management.
    const mockUserForProfile = UserModel(
      id: 'profileUser123',
      name: 'Jane Doe',
      contact: '555-123-7890',
      email: 'jane.doe@example.com',
      skills: ['Dart', 'Flutter', 'Testing'],
      profilePictureUrl: 'https://randomuser.me/api/portraits/women/10.jpg'
    );

    return MaterialApp(
      title: 'Skill It',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/main_nav', // Start with the main navigation screen (bottom nav bar)
      routes: {
        // Main navigation hub (Home, Search/Hire, Apply tabs)
        '/main_nav': (context) => const MainNavigationScreen(), 
        
        // Specific routes for navigation as per description
        '/landing': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return LandingScreen(user: args is UserModel ? args : null);
        },
        '/landing_after_logout': (context) { // Specific landing route for after logout
          final args = ModalRoute.of(context)?.settings.arguments;
          return LandingScreen(user: args is UserModel ? args : null);
        },
         '/landing_after_apply': (context) { // Specific landing route for after apply
          final args = ModalRoute.of(context)?.settings.arguments;
          return LandingScreen(user: args is UserModel ? args : null);
        },

        // Profile page can be pushed onto the stack
        '/profile': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          if (args is UserModel) {
            return ProfileScreen(user: args);
          }
          // Fallback or error if no user is provided, or use a default.
          // For now, using a mock if directly navigated and no args.
          return const ProfileScreen(user: mockUserForProfile);
        },

        // Apply page can be pushed (e.g., from HireScreen) or be a tab
        '/apply': (context) => const ApplyScreen(),

        // Home screen for direct navigation (e.g., "CANCEL" from ApplyPage)
        // This ensures that pressing cancel on Apply page goes to the home tab within MainNavigationScreen.
        // A better approach for tab navigation might involve a GlobalKey for NavigatorState on MainNavigationScreen
        // or using a state management solution to control the active tab.
        // For simplicity with named routes as requested:
        '/home': (context) => const MainNavigationScreen(), // This will show MainNavigationScreen, which defaults to Home (index 0)
      },
      // onGenerateRoute can be used for more complex routing or passing arguments
      // to routes not explicitly defined in the routes map.
      onGenerateRoute: (settings) {
        // Example: if you need to handle a route like '/profile/some_user_id'
        // if (settings.name?.startsWith('/profile/') ?? false) {
        //   final userId = settings.name!.substring('/profile/'.length);
        //   // Fetch user by userId and pass to ProfileScreen
        //   // return MaterialPageRoute(builder: (context) => ProfileScreen(user: fetchedUser));
        // }
        return null; // Let onUnknownRoute handle it or show an error
      },
      onUnknownRoute: (settings) {
        // Fallback for any undefined routes
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
      },
    );
  }
}