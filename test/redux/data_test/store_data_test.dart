import 'package:nncthang_todoapp/redux/reducers/app_reducer.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import 'app_state_data_test.dart';

final storeDataTest = Store<AppState>(
  appReducer,
  initialState: appStateDataTest,
);
