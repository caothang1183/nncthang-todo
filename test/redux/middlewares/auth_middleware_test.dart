import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nncthang_todoapp/network/auth_repository.dart';
import 'package:nncthang_todoapp/network/models/auth_criteria.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import '../data_test/store_data_test.dart';

class MockDriverRepository extends Mock implements AuthRepository {}

main() {
  MockDriverRepository repository;
  Store<AppState> store;

  setUp(() {
    repository = new MockDriverRepository();
    store = storeDataTest;
  });

  group('Auth MiddleWare test', () {
    test('get access-token when SignInAccountSuccessAction success', () {
      AuthCriteria criteria = AuthCriteria(username: "username", password: "password");
      String response = "accessToken 123";
      when(repository.signIn<String>(criteria)).thenAnswer((res) => Future.value(response));
      store.dispatch(SignInAccountSuccessAction(accessToken: response));
      expect(store.state.authState.accessToken, "accessToken 123");
      expect(store.state.authState.signingIn, false);
    });

    test('get error when SignInAccountSuccessAction error', () {
      AuthCriteria criteria = AuthCriteria(username: "username", password: "password");
      String response = "error message";
      when(repository.signIn<String>(criteria)).thenAnswer((res) => Future.error(response));
      store.dispatch(SignInAccountFailureAction(error: response));
      expect(store.state.authState.error, "error message");
      expect(store.state.authState.accessToken, "");
      expect(store.state.authState.signingIn, false);
    });
  });
}