class ProfileResponse {
  final String displayName;
  final String email;
  final String profilePic;

  ProfileResponse({
    required this.displayName,
    required this.email,
    required this.profilePic,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      displayName: json['data']['userInfo']['displayName'],
      email: json['data']['userInfo']['email'],
      profilePic: json['data']['userInfo']['profilePic'],
    );
  }
}
