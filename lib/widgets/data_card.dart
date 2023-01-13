import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Jesús Alberto Mena Dzul"),
            Text("5A"),
            Text("3 Horas y media"),
          ],
        ),
      ),
    );
  }
}
