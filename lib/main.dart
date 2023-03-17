import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer' as developer;

import './device_info_plus.dart';
import './contacts_service.dart';

void main() {
  runZonedGuarded(() {
    runApp(
      MaterialApp(
        title: 'Named Routes Demo',
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const DeviceInfoView(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/second': (context) => const ContactsServiceView(),
        },
      ),
    );
  }, (dynamic error, dynamic stack) {
    developer.log("Something went wrong!", error: error, stackTrace: stack);
  });
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the `FirstScreen` widget
          onPressed: () {
            // Navigate to the second screen using a named route.
            Navigator.pushNamed(context, '/second');
          },
          child: const Text('Launch screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // Within the SecondScreen widget
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
