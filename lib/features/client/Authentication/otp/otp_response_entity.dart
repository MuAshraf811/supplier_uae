class OtpResponse {
  final bool success;
  final String message;

  final String? verificationId; // Used for Firebase flow
  final String? code; // Used for Firebase flow
  final int? resendToken; // Used for Firebase flow
  final String? userCredential; // Used for Firebase flow

  OtpResponse({
    required this.success,
    required this.message,

    this.code,
    this.verificationId,
    this.resendToken,
    this.userCredential,
  });
}