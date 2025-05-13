import 'package:flutter/material.dart';

class ApplyScreen extends StatefulWidget {
  const ApplyScreen({super.key});

  @override
  State<ApplyScreen> createState() => _ApplyScreenState();
}

class _ApplyScreenState extends State<ApplyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _skillsController = TextEditingController();
  final _experienceController = TextEditingController();
  final _fieldController = TextEditingController();
  final _rateController = TextEditingController();

  @override
  void dispose() {
    _skillsController.dispose();
    _experienceController.dispose();
    _fieldController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  void _submitApplication() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data
      // String skills = _skillsController.text;
      // String experience = _experienceController.text;
      // String field = _fieldController.text;
      // String rate = _rateController.text;

      // For now, just navigate to Landing Page as per description
      Navigator.of(context).pushNamedAndRemoveUntil('/landing', (Route<dynamic> route) => false);
    }
  }

  void _cancelApplication() {
    // Navigate back to Home Page as per description
    // This assumes '/home' is a route that leads to the Home screen/tab,
    // possibly handled by MainNavigationScreen or a dedicated Home route.
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext.context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply'),
        // If this screen can be pushed, an automatic back button will appear.
        // If it's a tab, AppBar might be part of MainNavigationScreen.
        // For simplicity, assuming a standalone AppBar here.
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _skillsController,
                decoration: const InputDecoration(
                  labelText: 'Skills',
                  hintText: 'e.g., Flutter, Dart, Project Management',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your skills';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _experienceController,
                decoration: const InputDecoration(
                  labelText: 'Experience',
                  hintText: 'e.g., 5 years in software development, relevant projects',
                ),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe your experience';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _fieldController,
                decoration: const InputDecoration(
                  labelText: 'Field',
                  hintText: 'e.g., Mobile Development, UI/UX Design',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your field of expertise';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate',
                  hintText: 'e.g., 50 (specify currency/period if needed, or in description)',
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your desired rate';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _submitApplication,
                child: const Text('APPLY'),
              ),
              const SizedBox(height: 12.0),
              TextButton(
                onPressed: _cancelApplication,
                // style: TextButton.styleFrom(
                //   foregroundColor: Theme.of(context).colorScheme.error, // Or a less prominent color
                // ),
                child: const Text('CANCEL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}