import 'package:food_delivery/ui/screens/signup_and_login/form_submission_status.dart';

class SignUpState {
  final String email;
  final String password;
  final FormSubmissionStatus formStatus;

  bool get isEmailValid => email.length > 3; // modifiy later
  bool get isPasswordValid => email.length > 6; // modifiy later

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
