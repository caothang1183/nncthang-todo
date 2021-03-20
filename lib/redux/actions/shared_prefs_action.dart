class StoreLoginDataAction {
  final String accessToken;

  StoreLoginDataAction({this.accessToken});

  @override
  String toString() {
    return 'StoreLoginDataAction{}';
  }
}

class LoadLoginDataAction {
  @override
  String toString() {
    return 'LoadLoginDataAction{}';
  }
}
