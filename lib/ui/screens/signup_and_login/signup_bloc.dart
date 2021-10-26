import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/ui/screens/signup_and_login/auth/auth_repository.dart';
import 'package:food_delivery/ui/screens/signup_and_login/form_submission_status.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_event.dart';
import 'package:food_delivery/ui/screens/signup_and_login/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;

  SignUpBloc({required this.authRepo}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.signUp();
        yield state.copyWith(formStatus: FormSubmissionSuccess());
      } on Exception catch (e) {
        yield state.copyWith(formStatus: FormSubmissionFailed(e));
      }
    }
  }
}
