import 'package:flutter/material.dart';

class HeightScreen extends StatefulWidget {
  const HeightScreen({super.key});

  @override
  State<HeightScreen> createState() => _HeightScreenState();
}

class _HeightScreenState extends State<HeightScreen> {
  int _height = 165;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What is Your Height?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Spacer(),
            Text(
              '$_height cm',
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Slider(
              value: _height.toDouble(),
              min: 100,
              max: 250,
              divisions: 150,
              label: _height.toString(),
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen or save data
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
