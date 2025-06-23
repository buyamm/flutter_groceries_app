class SignupRequest {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignupRequest({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}
