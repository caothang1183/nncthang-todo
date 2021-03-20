import 'package:nncthang_todoapp/network/api_provider.dart';

class TaskRepository {
  final ApiProvider apiProvider;

  const TaskRepository(this.apiProvider);

  Future<T> loadTasks<T>() => apiProvider.fetchTasks<T>();

  Future<T> updateTaskStatus<T>(String id) => apiProvider.updateTasks<T>(id);

  Future<T> deleteTask<T>(String id) => apiProvider.deleteTask<T>(id);
}