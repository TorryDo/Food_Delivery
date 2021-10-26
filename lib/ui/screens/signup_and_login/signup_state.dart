import 'package:food_delivery/ui/screens/signup_and_login/form_submission_status.dart';

class SignUpState {
  final String email;
  bool get isEmailValid => email.length > 3; // modifiy later

  final String password;
  bool get isPasswordValid => email.length > 6; // modifiy later
  final FormSubmissionStatus formStatus;

  SignUpState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  SignUpState copyWith(
      {String? email, String? password, FormSubmissionStatus? formStatus}) {
    return SignUpState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
