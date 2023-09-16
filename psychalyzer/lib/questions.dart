class Question {
  final String text;
  final List<String> options;

  Question(this.text, this.options);
}

List<Question> questions = [
  Question('What is your favorite color?', ['Red', 'Blue', 'Green']),
  Question('Which animal do you prefer?', ['Dog', 'Cat', 'Bird']),
  Question('What is your favorite food?', ['Pasta', 'cream', 'new']),
  // Add more questions here
];
