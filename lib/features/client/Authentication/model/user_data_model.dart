class UserDataModel {
  UserDataModel({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.city,
  });

  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String city;

  factory UserDataModel.fromJson(Map<String, dynamic> res) {
    return UserDataModel(
      email: res["email"] ?? 'Something went wrong',
      password: res["password"] ?? '',
      firstName: res['first_name'] ?? '',
      lastName: res["last_name"] ?? '',
      mobileNumber: res["mobile_number"] ?? 'Something went wrong',
      city: res["city"] ?? "Something went wrong",
    );
  }
}
