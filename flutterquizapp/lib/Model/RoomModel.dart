class RoomModel {
  String currentUserid;
  String opponentUserid;
  String currentuserCorrect;
  String currentuserWrong;
  String opponentuserCorrect;
  String opponentuserWrong;

  RoomModel(
      {required this.currentUserid,
      required this.opponentUserid,
      required this.currentuserCorrect,
      required this.currentuserWrong,
      required this.opponentuserCorrect,
      required this.opponentuserWrong});

  Map<String, dynamic> toMap() {
    return {
      'currentUserid': currentUserid,
      'opponentUserid': opponentUserid,
      'currentuserCorrect': currentuserCorrect,
      'currentuserWrong': currentuserWrong,
      'opponentuserCorrect': opponentuserCorrect,
      'opponentuserWrong': opponentuserWrong
    };
  }
}
