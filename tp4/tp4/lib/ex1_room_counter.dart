import 'package:flutter/material.dart';

class RoomCounterApp extends StatelessWidget {
  const RoomCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const RoomCounterPage(capacity: 5),
    );
  }
}

class RoomCounterPage extends StatefulWidget {
  const RoomCounterPage({super.key, required this.capacity});

  final int capacity;

  @override
  State<RoomCounterPage> createState() => _RoomCounterPageState();
}

class _RoomCounterPageState extends State<RoomCounterPage> {
  int _count = 0;

  void _enter() {
    setState(() => _count++);
  }

  void _reset() => setState(() => _count = 0);

  @override
  Widget build(BuildContext context) {
    final bool isFull = _count >= widget.capacity;

    return Scaffold(
      appBar: AppBar(title: const Text('Salle B12')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CountLabel(value: _count, capacity: widget.capacity),
            const SizedBox(height: 24),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton.icon(
                  onPressed: isFull ? null : _enter,
                  icon: const Icon(Icons.person_add),
                  label: const Text('Entrée'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: _reset,
                  child: const Text('Réinitialiser'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CountLabel extends StatelessWidget {
  const CountLabel({super.key, required this.value, required this.capacity});

  final int value;
  final int capacity;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool isFull = value >= capacity;

    return Text(
      '$value / $capacity',
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: isFull ? colors.error : colors.primary,
          ),
    );
  }
}
