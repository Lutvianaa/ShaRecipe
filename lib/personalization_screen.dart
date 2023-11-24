import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import your dashboard screen

class PersonalizationScreen extends StatelessWidget {
  final List<String> recipeCategories = [
    'Italian Cuisine',
    'Asian Delights',
    'Healthy Eats',
    'Desserts Galore',
    'Comfort Foods',
    // Add more categories as needed
  ];

  void _continueToDashboard(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalize Your Recipes'),
        backgroundColor: Colors.deepOrange, // Set AppBar color to deepOrange
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select Your Preferred Recipe Categories:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recipeCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(recipeCategories[index]),
                    value: false,
                    onChanged: (newValue) {
                      // Implement logic to handle checkbox state change here
                      // For now, it's set to read-only
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => _continueToDashboard(context),
                  child: Text('Do this Later'),
                  style: TextButton.styleFrom(
                    primary: Colors.deepOrange, // Set text color to deepOrange
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _continueToDashboard(context),
                  child: Text('Personalize'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange, // Set button color to deepOrange
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Set background color to white
    );
  }
}
