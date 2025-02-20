import 'package:flutter/material.dart';

import 'height_screen.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  int _weight = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is Your Weight?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              '$_weight kg',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Slider(
              value: _weight.toDouble(),
              min: 40,
              max: 150,
              divisions: 110,
              label: _weight.toString(),
              onChanged: (value) {
                setState(() {
                  _weight = value.toInt();
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeightScreen()),
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
