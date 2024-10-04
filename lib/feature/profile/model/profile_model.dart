class User {
  final String? id;
  final String? name;
  final String? email;
  final String? profileImage;
  final String? userName;
  final String? drivingLicenseImage;
  final String? role;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.profileImage,
    this.userName,
    this.drivingLicenseImage,
    this.role,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  // Factory constructor for creating a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      profileImage: json['profileImage'] as String?,
      userName: json['userName'] as String?,
      drivingLicenseImage: json['drivingLicenseImage'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  // Method to convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'userName': userName,
      'drivingLicenseImage': drivingLicenseImage,
      'role': role,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  // Override the toString method to display user details
  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, profileImage: $profileImage, userName: $userName, drivingLicenseImage: $drivingLicenseImage, role: $role, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
