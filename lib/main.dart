import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/app_routing.dart';
import 'package:nncthang_todoapp/common/constants/colors.dart';
import 'package:nncthang_todoapp/common/constants/routes.dart';
import 'package:nncthang_todoapp/common/constants/strings.dart';
import 'package:nncthang_todoapp/redux/middlewares/log_middleware.dart';
import 'package:nncthang_todoapp/redux/middlewares/route_middleware.dart';
import 'package:nncthang_todoapp/redux/reducers/app_reducer.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(App());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final store = Store<AppState>(appReducer, initialState: AppState(), middleware: [
    ...logMiddleware(),
    ...routerMiddleware(),
  ]);

  @override
  Widget build(BuildContext context) {
    final todoAppTheme = ThemeData(
      fontFamily: Strings.defaultFontFamily,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.darkGrey,
            displayColor: AppColors.darkGrey,
            fontFamily: Strings.defaultFontFamily,
          ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.darkGrey,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        iconTheme: IconThemeData(
          color: AppColors.darkGrey,
        ),
      ),
      primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
            bodyColor: AppColors.darkGrey,
          ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Theme(
      data: todoAppTheme,
      child: StoreProvider(
        store: store,
        child: MaterialApp(
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: Strings.appName,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          onGenerateRoute: (settings) => generateRoute(settings),
          initialRoute: AppRoutes.homeRoute,
        ),
      ),
    );
  }
}
