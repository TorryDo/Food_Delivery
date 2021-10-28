import 'dart:developer';

class AuthRepository {

  Future<void> signUp() async {
    log('signUp');

    Future.delayed(const Duration(seconds: 3));

    log('signed in');
  }

  Future<void> logIn() async {
    log('logging in');

    Future.delayed(const Duration(seconds: 3));

    log('logged in');
  }

}
