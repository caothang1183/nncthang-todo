import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nncthang_todoapp/common/constants/dimens.dart';
import 'package:nncthang_todoapp/common/constants/strings.dart';
import 'package:nncthang_todoapp/common/entities/task.dart';
import 'package:nncthang_todoapp/presentation/widgets/complete_check_box.dart';
import 'package:nncthang_todoapp/presentation/widgets/deadline_picker.dart';
import 'package:nncthang_todoapp/presentation/widgets/large_raise_button.dart';
import 'package:nncthang_todoapp/presentation/widgets/text_form_field.dart';
import 'package:nncthang_todoapp/redux/actions/task_actions.dart';
import 'package:nncthang_todoapp/redux/selectors/task_selectors.dart';
import 'package:nncthang_todoapp/redux/states/app_state.dart';
import 'package:redux/redux.dart';

class EditTaskPage extends StatefulWidget {
  final Task taskUpdated;

  const EditTaskPage({
    Key key,
    this.taskUpdated,
  }) : super(key: key);

  @override
  _EditTaskPageState createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  var _taskController = TextEditingController();
  var _noteController = TextEditingController();
  final FocusNode _taskFocus = FocusNode();
  final FocusNode _noteFocus = FocusNode();
  bool completeCheckBox = false;
  String deadline = DateTime.now().toString();

  _fieldFocusChange(FocusNode currentFocus, FocusNode nextFocus) {
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void initState() {
    _taskController.text = widget.taskUpdated.task;
    _noteController.text = widget.taskUpdated.note;
    completeCheckBox = widget.taskUpdated.complete;
    deadline = widget.taskUpdated.deadline;
    super.initState();
  }

  @override
  void dispose() {
    _taskController.dispose();
    _noteController.dispose();
    _taskFocus.dispose();
    _noteFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Edit Task"),
      ),
      body: StoreConnector<AppState, _ViewModel>(
          converter: _ViewModel.fromStore,
          builder: (context, vm) {
            return SingleChildScrollView(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimens.defaultPadding),
                      TextFormFieldWidget(
                        label: 'New task',
                        controller: _taskController,
                        focusNode: _taskFocus,
                        onSubmitted: (term) {
                          _fieldFocusChange(_taskFocus, _noteFocus);
                        },
                      ),
                      SizedBox(height: Dimens.defaultPadding),
                      TextFormFieldWidget(
                        label: "Note task's description",
                        maxLines: 3,
                        controller: _noteController,
                        textInputAction: TextInputAction.done,
                        focusNode: _noteFocus,
                        onSubmitted: (value) {
                          _noteFocus.unfocus();
                        },
                      ),
                      SizedBox(height: Dimens.defaultPadding),
                      CompleteCheckBox(
                        value: completeCheckBox,
                        onChanged: (newValue) {
                          setState(() => completeCheckBox = newValue);
                        },
                      ),
                      DeadlinePicker(
                        deadline: deadline,
                        onPicked: (date) {
                          setState(() {
                            deadline = date.toString();
                          });
                        },
                      ),
                      SizedBox(height: Dimens.defaultPadding),
                      Column(
                        children: [
                          LargeRaiseButtonWidget(
                            loading: vm.updating,
                            label: Strings.btnUpdate,
                            labelColor: Colors.white,
                            backgroundColor: Colors.orange,
                            onTap: () {
                              Task newTask = Task(
                                id: widget.taskUpdated.id,
                                task: _taskController.text,
                                note: _noteController.text,
                                complete: completeCheckBox,
                                deadline: deadline,
                              );
                              if (_formKey.currentState.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Processing'),
                                  duration: Duration(milliseconds: 300),
                                ));
                                vm.editTask(newTask);
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
            );
          }),
    );
  }
}

class _ViewModel {
  final bool updating;
  final String error;
  final Function(Task task) editTask;

  _ViewModel({
    this.updating,
    this.error,
    this.editTask,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      updating: updatingTaskSelector(store.state),
      error: taskErrorMessageSelector(store.state),
      editTask: (Task task) => store.dispatch(EditTaskAction(task: task)),
    );
  }
}
