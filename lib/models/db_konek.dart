import 'dart:convert';

import 'package:http/http.dart' as http;
import './question_model.dart';

class DBkonek {
  final url = Uri.parse(
      'https://tugas-ce54e-default-rtdb.firebaseio.com/questions.json');

  // Future<void> addQuestion(Question question) async {
  //   http.post(url,
  //       body: json.encode({
  //         'title': question.title,
  //         'options': question.options,
  //       }));
  // }

  Future<List<Question>> fetchQuestions() async {
    // we got the data from just using this. now let's print it to see what we got.
    return http.get(url).then((response) {
      // the 'then' method returns a 'response' which is our data.
      // to whats inside we have to decode it first.
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key, // the encrypted key/the title we gave to our data
          title: value['title'], // title of the question
          options: Map.castFrom(value['options']), // options of the question
        );
        // add to newQuestions
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
