class HelpModels {
  final int id;
  final String question;
  final String answer;

  HelpModels({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory HelpModels.fromJson(json) {
    return HelpModels(
        id: json['id'], question: json['question'], answer: json['answer']);
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['question'] = question;
  //   data['answer'] = answer;
  //   return data;
  // }
}
