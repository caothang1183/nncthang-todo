import 'package:nncthang_todoapp/common/entities/task_response.dart';
import 'package:nncthang_todoapp/network/dio_manager.dart';

class ApiProvider {
  const ApiProvider();

  String host() => "https://nncthang-api.herokuapp.com/api";

  fetchTasks<T>() {
    return DioManager.dio.get('${host()}/tasks').then((resp) => TaskResponse.fromJson(resp.data) as T);
  }

  updateTasks<T>(String id) {
    return DioManager.dio.post('${host()}/tasks/updateStatus/$id').then((resp) => resp as T);
  }
}
