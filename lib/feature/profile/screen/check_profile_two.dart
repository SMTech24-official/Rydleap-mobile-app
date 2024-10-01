import 'package:flutter/material.dart';
import 'package:rydleap/core/share_pref/share_pref.dart';

class CheckProfileTwo extends StatelessWidget {
  const CheckProfileTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text('Into New Screen'),
             FutureBuilder<String?>(
                    future: SharePref
                        .getSavedEmail(), // The future that fetches the email
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          'Loading...', // Show loading state
                          style: TextStyle(fontSize: 18),
                        );
                      } else if (snapshot.hasError) {
                        return Text(
                          'Error: ${snapshot.error}', // Show error message
                          style: TextStyle(fontSize: 18),
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return Text(
                          'Email: ${snapshot.data}', // Show the retrieved email
                          style: TextStyle(fontSize: 18),
                        );
                      } else {
                        return Text(
                          'Email: Not provided', // Fallback if no email is found
                          style: TextStyle(fontSize: 18),
                        );
                      }
                    },
                  ),
          ],
        ),
      ),
    );
  }
}