import 'package:flutter/material.dart';
import '../models/user_model.dart';
// The project architect specified a 'user_info_view.dart' widget.
// Assuming it will be in 'lib/widgets/user_info_view.dart'
// If it's not created yet, this import will temporarily cause an error,
// but per instructions, we assume it will be correctly generated.
import '../widgets/user_info_view.dart'; 

// Assuming ProfileScreen exists at this path, as per typical structure and description.
// If 'profile_screen.dart' is not yet generated, this will be a temporary error.
import 'profile_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This would ideally be fetched from an authentication service or global state.
  // For now, using a mock user.
  final UserModel _currentUser = const UserModel(
    id: 'currentUser123',
    name: 'Current User Name',
    contact: '+1 555-0101',
    email: 'current.user@example.com',
    skills: ['Flutter Development', 'Dart Programming', 'Firebase', 'Problem Solving'],
    profilePictureUrl: 'https://randomuser.me/api/portraits/lego/1.jpg' // Example profile picture
  );

  void _navigateToProfilePage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProfileScreen(user: _currentUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        // No leading back button if this is a root tab screen
        automaticallyImplyLeading: false, 
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: _navigateToProfilePage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, ${_currentUser.name}!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 24.0),
            // Use the reusable UserInfoView widget.
            // This widget is expected to display name, contact, email, and skills.
            // It does not include the profile picture or logout button, which are specific to ProfileScreen.
            UserInfoView(
              name: _currentUser.name,
              contact: _currentUser.contact,
              email: _currentUser.email,
              skills: _currentUser.skills,
            ),
            // Additional home screen specific content can go here
            const SizedBox(height: 32.0),
            Text(
              'Recent Activity', // Example section
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16.0),
            Card(
              child: ListTile(
                leading: const Icon(Icons.work_history_outlined),
                title: const Text('You applied for "Senior Flutter Developer"'),
                subtitle: const Text('Status: Pending Review'),
                onTap: () {
                  // Navigate to application details or similar
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: const Icon(Icons.message_outlined),
                title: const Text('New message from "Recruiter X"'),
                subtitle: const Text('Regarding your application...'),
                onTap: () {
                  // Navigate to messages
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}