import 'package:flutter/material.dart';
import 'package:graduation_project/features/Setup/presentation/view/weight_screen.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  int _age = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How Old Are You?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              '$_age',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Slider(
              value: _age.toDouble(),
              min: 18,
              max: 100,
              divisions: 82,
              label: _age.toString(),
              onChanged: (value) {
                setState(() {
                  _age = value.toInt();
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeightScreen()),
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
