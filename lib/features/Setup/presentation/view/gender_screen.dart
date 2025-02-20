import 'package:flutter/material.dart';
import 'package:graduation_project/features/Setup/presentation/view/age_screen.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What\'s your gender'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _GenderButton(icon: Icons.male, label: 'Male'),
                _GenderButton(icon: Icons.female, label: 'Female'),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AgeScreen()),
                );
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}

class _GenderButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GenderButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 50),
        const SizedBox(height: 10),
        Text(label),
      ],
    );
  }
}
