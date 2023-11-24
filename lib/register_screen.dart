import 'package:flutter/material.dart';
import 'personalization_screen.dart'; // Import your personalization screen
import 'login_screen.dart'; // Import your login screen

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _register(BuildContext context) {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PersonalizationScreen()),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill in all fields.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.brown, // Set text color to deepOrange
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/ShaRecipe.png', // Replace with your logo asset path
              width: 100,
              height: 100,
              // Adjust width and height as needed
            ),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email/Phone Number',
                prefixIcon: Icon(Icons.email), // Icon for email/phone number
                border: OutlineInputBorder(), // Border for all sides
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock), // Icon for password
                border: OutlineInputBorder(), // Full border for all sides
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown, // Set button color to deepOrange
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(
                'Already have an Account? Login Here',
                style: TextStyle(
                  color: Colors.brown, // Set text color to deepOrange
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
    );
  }
}
