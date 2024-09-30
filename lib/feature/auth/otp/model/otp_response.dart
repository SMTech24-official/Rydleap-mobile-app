class OtpResponse {
  final bool success;
  final String message;
  final OtpData? data; // Made this field nullable

  OtpResponse({
    required this.success,
    required this.message,
    this.data, // Optional
  });

  factory OtpResponse.fromJson(Map<String, dynamic> json) {
    return OtpResponse(
      success: json['success'] ?? false, // Default to false if null
      message: json['message'] ?? '', // Default to empty string if null
      data: json['data'] != null ? OtpData.fromJson(json['data']) : null, // Check for null
    );
  }
}

class OtpData {
  final String body;
  final String from;
  final String to;
  final String status;
  final String sid;
  final DateTime dateCreated;

  OtpData({
    required this.body,
    required this.from,
    required this.to,
    required this.status,
    required this.sid,
    required this.dateCreated,
  });

  factory OtpData.fromJson(Map<String, dynamic> json) {
    return OtpData(
      body: json['body'] ?? '', // Default to empty string if null
      from: json['from'] ?? '', // Default to empty string if null
      to: json['to'] ?? '', // Default to empty string if null
      status: json['status'] ?? '', // Default to empty string if null
      sid: json['sid'] ?? '', // Default to empty string if null
      dateCreated: DateTime.parse(json['dateCreated'] ?? DateTime.now().toIso8601String()), // Default to now if null
    );
  }
}
