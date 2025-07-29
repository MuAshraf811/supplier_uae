import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supplier_app/core/utils/widgets/snack_bar.dart';

import 'otp_response_entity.dart';
class OtpRemoteDataSourceFirebaseImpl{
  final FirebaseAuth _auth;
  String? _verificationId;
  int? _resendToken;

  OtpRemoteDataSourceFirebaseImpl({
    FirebaseAuth? auth,
  }) : _auth = auth ?? FirebaseAuth.instance;

  Future<OtpResponse> sendOtp({
    required String mobile,
    String? generatedOtp,
  }) async {
    final completer = Completer<OtpResponse>();
    try {
      print("SMS mobile");
      print(mobile);
      final result = await _auth.verifyPhoneNumber(
        phoneNumber: formatPhoneNumber(mobile),
        timeout: const Duration(seconds: 30),
        verificationCompleted: (credential) async {
          // Android only: when the SMS is automatically detected
          try {
            await _auth.signInWithCredential(credential);
            if (!completer.isCompleted) {
              completer.complete(OtpResponse(
                success: true,
                message: 'Auto-verified successfully',
                userCredential: credential.smsCode,
              ));
            }
          } catch (e) {
            if (!completer.isCompleted) {
              completer.completeError(e);
            }
          }
          // showCustomSnackBar(context, text, backgroundColor);
          log('verificationCompleted');
        },
        verificationFailed: (error) {
          if (!completer.isCompleted) {
            completer.complete(OtpResponse(
              success: false,
              message: getErrorMessage(error),
            ));
          }
          // log('verificationFailed');
          // msgToast(message: 'Phone Verification Failed');
          // log('##########################');
          // log(error.message.toString());
          // log(error.code);
          // log(error.plugin);
          // log('##########################');
          // msgToast(
          //     message: error.message.toString(),
          //     selfColor: Colors.red);
        },
        codeSent:
            (verificationId, forceResendingToken) {
              _verificationId = verificationId;
              _resendToken = forceResendingToken;
              if (!completer.isCompleted) {
                completer.complete(OtpResponse(
                  success: true,
                  message: 'OTP sent successfully',
                  verificationId: verificationId,
                  resendToken: forceResendingToken,
                ));
              }
        },
        codeAutoRetrievalTimeout: (verificationId) {
          if (!completer.isCompleted) {
            completer.complete(OtpResponse(
              success: false,
              message: 'OTP verification timeout',
              verificationId: verificationId,
            ));
            log('OTP verification timeout');
          }

        },
        forceResendingToken: _resendToken,
      );
      return await completer.future;
    } catch (e,stack) {
      print(stack);
      return OtpResponse(
        success: false,
        message: 'Failed to send OTP: ${e.toString()}',
      );
    }
  }

  Future<OtpResponse> verifyOtp({
    required String userCode,
    String? mobile,
  }) async{
    try {
      if (_verificationId == null) {
        return OtpResponse(
          success: false,
          message: 'No verification ID found. Please request OTP first.',
        );
      }

      // Create credential
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: userCode,
      );

      // Sign in with credential
      final userCredential = await _auth.signInWithCredential(credential);

      if (userCredential.user != null) {
        return OtpResponse(
          success: true,
          message: 'OTP verified successfully',
          userCredential: userCredential.user?.uid,
        );
      } else {
        return OtpResponse(
          success: false,
          message: 'Failed to verify OTP: No user returned',
        );
      }
    } on FirebaseAuthException catch (e,stack) {
      print(stack);
      return OtpResponse(
        success: false,
        message: getErrorMessage(e),
      );
    } catch (e,stack) {
      print(stack);
      return OtpResponse(
        success: false,
        message: 'Failed to verify OTP: ${e.toString()}',
      );
    }
  }
  String formatPhoneNumber(String mobile) {
    // Add '+' if not present and ensure proper formatting
    if (!mobile.startsWith('+')) {
      mobile = '+$mobile';
    }
    return mobile;
  }

  String getErrorMessage(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-phone-number':
        return 'The provided phone number is invalid.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'operation-not-allowed':
        return 'Phone number authentication is not enabled.';
      default:
        return 'An error occurred: ${e.message}';
    }
  }

}