import '../Providers/department_provider.dart';

class DepartmentRepository {
  final DepartmentApi departmentApi;

  DepartmentRepository(this.departmentApi);

  getAll() {
    return departmentApi.getAll();
  }

  getOne({required String slug}) {
    return departmentApi.getOne(slug: slug);
  }

  // delete(String slug) {
  //   return departmentApi.delete(id);
  // }

  // edit(Department department) {
  //   return departmentApi.edit(department);
  // }

  // add(Department department) {
  //   return departmentApi.add(department);
  // }
}
