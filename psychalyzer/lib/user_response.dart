import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:psychalyzer/questions.dart';

class UserResponse {
  final Question question;
  final String selectedOption;

  UserResponse(this.question, this.selectedOption);

  Map<String, dynamic> toMap() {
    return {
      'question': question.text,
      'selectedOption': selectedOption,
    };
  }
}

Future<void> addUserResponse(UserResponse userResponse) async {
  try {
    await FirebaseFirestore.instance
        .collection('user_responses')
        .add(userResponse.toMap());
    print('User response added to Firestore.');
  } catch (e) {
    print('Error adding user response: $e');
  }
}
