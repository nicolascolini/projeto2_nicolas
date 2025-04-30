import '../../common/errors/errors_classes.dart';
import '../../common/patterns/result.dart';
import '../../domain/entities/student_info_entity.dart';

abstract class LocalStorageContract {
  Future<Result<StudentInfoEntity, Failure>> fetchStudent();

  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student);
}
