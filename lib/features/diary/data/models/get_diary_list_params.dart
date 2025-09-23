class DiaryListReqParams {
  final String userid;
  final String appointment;

  DiaryListReqParams({required this.userid, required this.appointment});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{"userid": userid, "appoint": appointment};
  }
}
