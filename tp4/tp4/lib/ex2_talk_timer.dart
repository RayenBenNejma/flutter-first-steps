import 'dart:async';

import 'package:flutter/material.dart';

class TalkTimerApp extends StatelessWidget {
  const TalkTimerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
      home: const TalkTimerPage(),
    );
  }
}

class TalkTimerPage extends StatefulWidget {
  const TalkTimerPage({super.key});

  @override
  State<TalkTimerPage> createState() => _TalkTimerPageState();
}

class _TalkTimerPageState extends State<TalkTimerPage> {
  bool _showTimer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chrono de présentation')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Afficher le chrono'),
                Switch(
                  value: _showTimer,
                  onChanged: (value) => setState(() => _showTimer = value),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (_showTimer)
              const TalkTimer(limitSeconds: 10)
            else
              const Text('Chrono masqué'),
          ],
        ),
      ),
    );
  }
}

class TalkTimer extends StatefulWidget {
  const TalkTimer({super.key, required this.limitSeconds});

  final int limitSeconds;

  @override
  State<TalkTimer> createState() => _TalkTimerState();
}

class _TalkTimerState extends State<TalkTimer> {
  int _seconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _seconds++);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;
    final bool overtime = _seconds > widget.limitSeconds;

    return Text(
      '${_seconds}s',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: overtime ? colors.error : colors.onSurface,
          ),
    );
  }
}
