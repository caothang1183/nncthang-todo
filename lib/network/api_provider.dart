import 'dart:convert';
import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/network/dio_manager.dart';
import 'package:nncthang_todoapp/network/models/auth_criteria.dart';
import 'package:nncthang_todoapp/network/models/task_criteria.dart';

class ApiProvider {
  const ApiProvider();

  // String host() => "http://localhost:4000/api";
  String host() => "https://nncthang-api.herokuapp.com/api";

  signInAccount<T>(AuthCriteria criteria) {
    return DioManager.dio
        .post('${host()}/auth', data: jsonEncode({'username': criteria.username, 'password': criteria.password}))
        .then((resp) => resp.data["access-token"] as String);
  }

  fetchTasks<T>() {
    return DioManager.dio.get('${host()}/tasks').then((resp) => TaskResponse.fromJson(resp.data) as T);
  }

  addTask<T>(TaskCriteria criteria) {
    return DioManager.dio
        .post('${host()}/tasks',
            data: jsonEncode({
              'task': criteria.task,
              'note': criteria.note,
              'complete': criteria.complete,
              'deadline': criteria.deadline
            }))
        .then((resp) => resp as T);
  }

  updateTask<T>(TaskCriteria criteria) {
    return DioManager.dio.post('${host()}/tasks/${criteria.id}',
        data: jsonEncode({
          'task': criteria.task,
          'note': criteria.note,
          'complete': criteria.complete,
          'deadline': criteria.deadline
        })).then((resp) => resp as T);
  }

  updateTaskStatus<T>(String id) {
    return DioManager.dio.post('${host()}/tasks/updateStatus/$id').then((resp) => resp as T);
  }

  deleteTask<T>(String id) {
    return DioManager.dio.get('${host()}/tasks/del/$id').then((resp) => resp as T);
  }
}
