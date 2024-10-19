class CustomFirebaseUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  CustomFirebaseUser({
    required this.uid,
    this.email,
    this.displayName,
    this.photoURL,
  });

  // Convert CustomFirebaseUser to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    };
  }

  // Convert JSON to CustomFirebaseUser
  factory CustomFirebaseUser.fromJson(Map<String, dynamic> json) {
    return CustomFirebaseUser(
      uid: json['uid'],
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
    );
  }
}
