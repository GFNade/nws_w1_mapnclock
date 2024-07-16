import 'dart:async';
import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late DateTime _time;

  @override
  void initState() {
    super.initState();
    _time = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTime);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime(Timer timer) {
    setState(() {
      _time = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = '${_time.hour.toString().padLeft(2, '0')}:${_time.minute.toString().padLeft(2, '0')}:${_time.second.toString().padLeft(2, '0')}';
    return Scaffold(
      appBar: AppBar(
        title: const Text('CLOCK', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 250), 
          Center(
            child: Text(
              formattedTime,
              style: const TextStyle(fontSize: 60),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}