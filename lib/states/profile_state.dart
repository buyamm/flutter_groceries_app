class ProfileState {
  final String displayName;
  final String email;
  final String errorMessage;
  final String profilePic;
  final bool isLoading;

  ProfileState({
    required this.displayName,
    required this.email,
    required this.errorMessage,
    required this.profilePic,
    required this.isLoading,
  });

  ProfileState copyWith({
    String? displayName,
    String? email,
    String? errorMessage,
    String? profilePic,
    bool? isLoading,
  }) {
    return ProfileState(
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
      profilePic: profilePic ?? this.profilePic,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
