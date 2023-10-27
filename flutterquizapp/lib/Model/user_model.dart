class UserModel {
  String id;
  String email;
  String name;
  String correct;
  String wrong;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.correct,
      required this.wrong});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'correct': correct,
      'wrong': wrong
    };
  }
}
