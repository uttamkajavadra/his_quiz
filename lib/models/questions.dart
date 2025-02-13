class Questions {
  final String questionText;
  final List<String> options;
  int selectedOption;

  Questions({
    required this.questionText,
    required this.options,
    this.selectedOption = -1,
  });
}
