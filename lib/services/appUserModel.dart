class AppUser {
  final String uid;
  final String email;
  final bool isEmailVerified;

  AppUser({
    required this.uid,
    required this.isEmailVerified,
    required this.email,
  });
}
