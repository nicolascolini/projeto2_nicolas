import 'package:projeto2_nicolas/helper/studente_fake_repository.dart';

import '../../common/errors/errors_classes.dart';
import '../../common/patterns/result.dart';
import '../../domain/entities/student_info_entity.dart';
import 'local_storage_contract.dart';

class FakeDbService implements LocalStorageContract {
  StudentFakeApiDataBase fakeDB = StudentFakeApiDataBase();

  @override
  Future<Result<StudentInfoEntity, Failure>> fetchStudent() async {
    try {
      var result = await fakeDB.getData();
      StudentInfoEntity student = StudentInfoEntity.fromJson(result);
      return Success(student);
    } on DatasourceResultEmpty catch (e) {
      return Error(DatasourceResultEmpty(e.toString()));
    } on APIFailure catch (e) {
      return Error(APIFailure(e.toString()));
    } on Exception catch (e) {
      return Error(DefaultError('Erro ao buscar estudante: ${e.toString()}'));
    }
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      fakeDB.updateData(student.toJson());

      return const Success(null);
      // ignore: nullable_type_in_catch_clause
    } on APIFailurelureOnSave catch (e) {
      return Error(APIFailureOnSave(e.toString()));
      // ignore: dead_code_on_catch_subtype
    } on Exception catch (e) {
      return Error(DefaultError('Erro ao buscar o estudante: ${e.toString()}'));
    }
  }
}
