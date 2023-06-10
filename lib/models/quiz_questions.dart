class QuestionsQuiz {
  final String question;
  final List<String> options;
  const QuestionsQuiz({required this.question, required this.options});

  List<String> get shuffledList {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
