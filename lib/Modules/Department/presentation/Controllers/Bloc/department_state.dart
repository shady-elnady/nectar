part of 'department_bloc.dart';

abstract class DepartmentState extends Equatable {
  const DepartmentState();
  
  @override
  List<Object> get props => [];
}

class DepartmentInitial extends DepartmentState {}
