import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/widgets/task_data_container.dart';
import 'package:nncthang_todoapp/redux/selectors/task_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class AllTaskFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        builder: (context, vm) => TaskDataContainer(
          tasks: vm.tasks,
          isLoading: vm.isLoading,
          error: vm.error,
          updating: vm.updating,
        ),
      ),
    );
  }
}

class _ViewModel {
  final List<Task> tasks;
  final bool isLoading;
  final String error;
  final bool updating;

  _ViewModel({
    this.tasks,
    this.isLoading,
    this.error,
    this.updating
  });

  static _ViewModel fromStore(Store<AppState> store) {
    var _state = store.state;
    return _ViewModel(
      tasks: allTaskSelector(_state),
      isLoading: isLoadingTaskSelector(_state),
      error: taskErrorMessageSelector(_state),
      updating: updatingTaskSelector(_state),
    );
  }
}
