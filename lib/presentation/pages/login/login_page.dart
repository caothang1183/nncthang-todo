import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/constants/strings.dart';
import 'package:nncthang_todoapp/presentation/widgets/large_raise_button.dart';
import 'package:nncthang_todoapp/presentation/widgets/text_form_field.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/shared_prefs_action.dart';
import 'package:nncthang_todoapp/redux/selectors/auth_state_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  _fieldFocusChange(FocusNode currentFocus, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    _usernameController.text = "test";
    _passwordController.text = "Test123";
    super.initState();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    _usernameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        onInit: (store) {
          store.dispatch(LoadLoginDataAction());
        },
        builder: (context, vm) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: Dimens.defaultPadding,
                  right: Dimens.defaultPadding,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Dimens.appHeight(context) / 8),
                      Text(
                        "Todo App",
                        style: TextStyle(
                          color: AppColors.darkGrey,
                          fontStyle: FontStyle.italic,
                          fontSize: Dimens.largeFontSize * 2,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      TextFormFieldWidget(
                        label: 'Username',
                        controller: _usernameController,
                        focusNode: _usernameFocus,
                        onSubmitted: (term) {
                          _fieldFocusChange(_usernameFocus, _passwordFocus);
                        },
                      ),
                      SizedBox(height: Dimens.defaultPadding),
                      TextFormFieldWidget(
                        label: "Password",
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        focusNode: _passwordFocus,
                        isPassword: true,
                        onSubmitted: (value) {
                          _passwordFocus.unfocus();
                        },
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(
                          right: 10,
                          bottom: Dimens.defaultPadding,
                          top: Dimens.defaultPadding,
                        ),
                        child: Text(
                          Strings.forgotPassword,
                          style: TextStyle(
                            decorationThickness: 1.0,
                            color: AppColors.darkGrey,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      SizedBox(height: Dimens.defaultPadding),
                      Column(
                        children: [
                          LargeRaiseButtonWidget(
                            loading: vm.signingIn,
                            label: Strings.btnSignIn,
                            labelColor: Colors.white,
                            backgroundColor: Colors.orange,
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                // If the form is valid, display a Snackbar.
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing')));
                                vm.signInAccount(_usernameController.text, _passwordController.text);
                              }
                            },
                          ),
                          vm.error != ""
                              ? Text(vm.error, style: TextStyle(color: Colors.redAccent))
                              : SizedBox.shrink(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ViewModel {
  final bool signingIn;
  final String error;
  final Function(String username, String password) signInAccount;

  _ViewModel({
    this.signingIn,
    this.error,
    this.signInAccount,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      signingIn: signingInSelector(store.state),
      error: loginErrorMessageSelector(store.state),
      signInAccount: (String username, String password) => store.dispatch(
        SignInAccountAction(
          username: username,
          password: password,
        ),
      ),
    );
  }
}
