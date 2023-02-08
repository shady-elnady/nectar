part of 'department_bloc.dart';

abstract class DepartmentState extends Equatable {
  const DepartmentState();

  @override
  List<Object> get props => [];
}

class InitialDepartmentState extends DepartmentState {}

class LoadingDepartmentsState extends DepartmentState {}

class LoadedDepartmentsState extends DepartmentState {
  final List<Department> departments;

  const LoadedDepartmentsState({required this.departments});

  @override
  List<Object> get props => [
        departments,
      ];
}

class ErrorDepartmentsState extends DepartmentState {
  final String message;

  const ErrorDepartmentsState({required this.message});

  @override
  List<Object> get props => [
        message,
      ];
}
