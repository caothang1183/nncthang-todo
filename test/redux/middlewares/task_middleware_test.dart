import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/network/models/auth_criteria.dart';
import 'package:nncthang_todoapp/network/task_repository.dart';
import 'package:nncthang_todoapp/redux/actions/authentication_actions.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import '../data_test/app_state_data_test.dart';
import '../data_test/store_data_test.dart';

class MockDriverRepository extends Mock implements TaskRepository {}

main() {
  MockDriverRepository repository;
  Store<AppState> store;

  setUp(() {
    repository = new MockDriverRepository();
    store = storeDataTest;
  });

  group('Task MiddleWare test', () {
    test('get TaskResponse when LoadTasksAction success', () {
      TaskResponse response = appStateDataTest.taskState.taskResponse;
      when(repository.loadTasks<TaskResponse>()).thenAnswer((res) => Future.value(response));
      store.dispatch(LoadTasksSuccessAction(taskResponse: response));
      expect(store.state.taskState.taskResponse.tasks.length, 3);
      expect(store.state.taskState.taskResponse.tasks[0].id, "1");
    });

    test('get error when LoadTasksAction error', () {
      String response = "error message";
      when(repository.loadTasks<TaskResponse>()).thenAnswer((res) => Future.error(response));
      store.dispatch(LoadTasksFailureAction(error: response));
    });
  });
}
