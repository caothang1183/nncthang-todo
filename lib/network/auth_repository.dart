import 'package:nncthang_todoapp/network/api_provider.dart';
import 'package:nncthang_todoapp/network/models/auth_criteria.dart';

class AuthRepository {
  final ApiProvider apiProvider;

  const AuthRepository(this.apiProvider);

  Future<T> signIn<T>(AuthCriteria criteria) => apiProvider.signInAccount<T>(criteria);
}
