class OpponentModel {
  String id;
  String name;
  int correct;
  int wrong;

  OpponentModel(
      {required this.id,
      required this.name,
      required this.correct,
      required this.wrong});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'correct': correct, 'wrong': wrong};
  }
}
