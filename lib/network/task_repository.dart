import 'package:nncthang_todoapp/network/api_provider.dart';
import 'package:nncthang_todoapp/network/models/task_criteria.dart';

class TaskRepository {
  final ApiProvider apiProvider;

  const TaskRepository(this.apiProvider);

  Future<T> loadTasks<T>() => apiProvider.fetchTasks<T>();

  Future<T> addTask<T>(TaskCriteria criteria) => apiProvider.addTask<T>(criteria);

  Future<T> updateTask<T>(TaskCriteria criteria) => apiProvider.updateTask<T>(criteria);

  Future<T> updateTaskStatus<T>(String id) => apiProvider.updateTaskStatus<T>(id);

  Future<T> deleteTask<T>(String id) => apiProvider.deleteTask<T>(id);
}