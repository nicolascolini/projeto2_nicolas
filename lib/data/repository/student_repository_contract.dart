import '../../common/errors/errors_classes.dart';
import '../../common/patterns/result.dart';
import '../../domain/entities/student_info_entity.dart';

abstract class StudentRepositoryContract {
  Future<Result<StudentInfoEntity, Failure>> getStudent();
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student);
}
