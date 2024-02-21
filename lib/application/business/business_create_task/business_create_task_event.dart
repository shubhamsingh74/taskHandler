// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "business_create_task_bloc.dart";

@immutable
abstract class BusinessCreateTaskEvent {}

class BusinessCreateTaskRequestEvent extends BusinessCreateTaskEvent {
 final CreateTaskRequestModel createTaskRequestModel;
  BusinessCreateTaskRequestEvent({
    required this.createTaskRequestModel,
  });
}
