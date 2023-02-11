import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nectar_mac/App/Exceptions/failure.dart';
import 'package:nectar_mac/App/Models/base_usecase.dart';

import '../../domain/Entities/department.dart';
import '../../domain/UseCases/get_departments_usecase.dart';

part 'department_event.dart';
part 'department_state.dart';

class DepartmentBloc extends Bloc<DepartmentEvent, DepartmentState> {
  final GetAllDepartmentUseCase getAllDepartments;
  DepartmentBloc({
    required this.getAllDepartments,
  }) : super(InitialDepartmentState()) {
    on<DepartmentEvent>((event, emit) async {
      if (event is GetDepartmentsEvent) {
        emit(LoadingDepartmentsState());

        final failureOrPosts =
            await getAllDepartments(parameters: const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshDepartmentsEvent) {
        emit(LoadingDepartmentsState());

        final failureOrPosts =
            await getAllDepartments(parameters: const NoParameters());
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }

  DepartmentState _mapFailureOrPostsToState(
      Either<Failure, List<Department>> either) {
    return either.fold(
      (failure) =>
          ErrorDepartmentsState(message: FailureToMessage.call(failure)),
      (departments) => LoadedDepartmentsState(
        departments: departments,
      ),
    );
  }
}
