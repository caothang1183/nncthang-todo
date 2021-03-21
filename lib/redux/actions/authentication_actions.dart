class SignInAccountAction {
  final String username;
  final String password;

  SignInAccountAction({
    this.username = "",
    this.password = "",
  });

  String toString() {
    return 'SignInAccountAction{}';
  }
}

class SigningInAccountAction {
  String toString() {
    return 'SigningInAccountAction{}';
  }
}

class SignInAccountSuccessAction {
  final String accessToken;

  SignInAccountSuccessAction({this.accessToken});

  String toString() {
    return 'SignInAccountSuccessAction{}';
  }
}

class SignInAccountFailureAction {
  final String error;

  SignInAccountFailureAction({this.error = ""});

  String toString() {
    return 'SignInAccountFailureAction{}';
  }
}


class LogoutAccountAction {
  String toString() {
    return 'LogoutAccountAction{}';
  }
}
