import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/constants/strings.dart';
import 'package:nncthang_todoapp/common/emuns.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/all_task.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/complete_tasks.dart';
import 'package:nncthang_todoapp/presentation/pages/home/fragments/incomplete_tasks.dart';
import 'package:nncthang_todoapp/presentation/widgets/bottom_navigator.dart';
import 'package:nncthang_todoapp/redux/actions/app_actions.dart';
import 'package:nncthang_todoapp/redux/actions/route_actions.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/selectors/app_state_selector.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "All Task",
      "Complete Tasks",
      "Incomplete Tasks",
    ];

    final List<Widget> pages = [
      AllTaskFragment(),
      CompleteTasksFragment(),
      IncompleteTasksFragment(),
    ];
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return StoreConnector<AppState, _ViewModel>(
        converter: _ViewModel.fromStore,
        onInit: (store) => store.dispatch(LoadTasksAction()),
        builder: (context, vm) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text(Strings.appBar + " - ${titles[vm.currentIndex]}"),
            ),
            body: pages.elementAt(vm.currentIndex),
            bottomNavigationBar: BottomTabBar(
              currentIndex: vm.currentIndex,
              onTap: vm.onBottomTap,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: vm.openAddTask,
              child: Icon(Icons.add),
            ),
          );
        });
  }
}

class _ViewModel {
  final int currentIndex;
  final Function onBottomTap;
  final Function openAddTask;

  _ViewModel({
    this.currentIndex,
    this.onBottomTap,
    this.openAddTask,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      currentIndex: bottomAppBarSelector(store.state).index,
      onBottomTap: (index) => store.dispatch(
        SelectBottomTabBarAction(
          activeBottomTabBar: TodoBottomTabBar.values[index],
        ),
      ),
      openAddTask: () {
        store.dispatch(OpenAddTaskPageAction());
      },
    );
  }
}
