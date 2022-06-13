part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  List<TaskEntity>? items;
  HomeInitial({this.items});
}

class EditTaskList extends HomeState {
  List<TaskEntity> items;
  EditTaskList({required this.items});
}
