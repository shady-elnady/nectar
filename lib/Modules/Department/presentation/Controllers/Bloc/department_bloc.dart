import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  DepartmentBloc() : super(DepartmentInitial()) {
    on<DepartmentEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
