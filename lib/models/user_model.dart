class UserModel {
  String? userImage; // بدل XFile
  String? email;
  String? userName;
  String? phoneNumber;
  int? totalQuestions;
  int? totalCorrectAnswers;
  int? totalQuizsCompelete;
  bool? isMale;

  UserModel({
    this.userImage,
    this.email,
    this.totalCorrectAnswers,
    this.totalQuestions,
    this.totalQuizsCompelete,
    this.userName,
    this.phoneNumber,
    this.isMale,
  });

  UserModel.fromJson(Map<String, dynamic> data) {
    userImage = data['userImage']; // String من Firebase
    email = data['email'];
    userName = data['userName'];
    phoneNumber = data['phoneNumber'];
    totalQuestions = data['totalQuestions'];
    totalCorrectAnswers = data['totalCorrectAnswers'];
    totalQuizsCompelete = data['totalQuizsCompelete'];
    isMale = data["isMale"];
  }

  Map<String, dynamic> toJson() {
    return {
      'userImage': userImage, // نخزن كـ String
      'email': email,
      'userName': userName,
      'phoneNumber': phoneNumber,
      "isMale": isMale,
      'totalQuestions': totalQuestions,
      'totalCorrectAnswers': totalCorrectAnswers,
      'totalQuizsCompelete': totalQuizsCompelete,
    };
  }
}
