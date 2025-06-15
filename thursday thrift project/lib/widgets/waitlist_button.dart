import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WaitlistButton extends StatelessWidget {
  const WaitlistButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        const url = 'https://tally.so/r/mKvbkX';
        if (await canLaunch(url)) {
          await launch(url, webOnlyWindowName: '_blank');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        elevation: 0,
      ),
      child: const Text(
        'Join the waitlist',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
} 