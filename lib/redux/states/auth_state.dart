class AuthState {
  final String accessToken;
  final DateTime lastSigningIn;
  final bool signingIn;
  final String error;

  AuthState copyWith({
    DateTime lastSigningIn,
    String accessToken,
    bool signingIn,
    String error,
  }) {
    return AuthState(
      lastSigningIn: lastSigningIn ?? this.lastSigningIn,
      accessToken: accessToken ?? this.accessToken,
      signingIn: signingIn ?? this.signingIn,
      error: error ?? this.error,
    );
  }

  const AuthState({
    this.lastSigningIn,
    this.accessToken = "",
    this.signingIn = false,
    this.error = "",
  });
}
