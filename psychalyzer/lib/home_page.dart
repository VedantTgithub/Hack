import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'questions.dart'; // Import your Question and UserResponse classes
import 'user_response.dart'; // Import your UserResponse class
// Import the login page where users will be redirected after logout

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.blue,
        actions: [
          // Add a logout button
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _signOut,
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];

            return Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(8.0), // Add padding for better spacing
                child: Column(
                  children: [
                    Text(
                      question.text,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (String option in question.options)
                      Row(
                        children: [
                          Radio(
                            value: option,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                          Text(option),
                        ],
                      ),
                    ElevatedButton(
                      onPressed: () {
                        if (selectedOption != null) {
                          final userResponse =
                              UserResponse(question, selectedOption!);
                          addUserResponse(userResponse);
                        } else {
                          // Handle case when no option is selected
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Function to handle user logout
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    // Navigate to the login page upon successful logout
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
