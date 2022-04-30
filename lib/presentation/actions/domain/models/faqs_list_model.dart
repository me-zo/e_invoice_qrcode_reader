class FaqsListModel {
  final List<FaqsQuestionModel> questions;

  FaqsListModel({required this.questions});

  factory FaqsListModel.empty() => FaqsListModel(questions: []);
}

class FaqsQuestionModel {
  final String title;
  final String answer;

  FaqsQuestionModel({required this.title, required this.answer});
}
