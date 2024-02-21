part of "business_create_task_bloc.dart";

@immutable
abstract class BusinessCreateTaskState {}

class BusinessCreateTaskInitialState extends BusinessCreateTaskState {}
class BusinessCreateTaskLoadingState extends BusinessCreateTaskState {}

class BusinessCreateTaskSuccessState extends BusinessCreateTaskState {}

class BusinessCreateTaskErrorState extends BusinessCreateTaskState {}
