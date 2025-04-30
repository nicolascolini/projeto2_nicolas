import '../../common/errors/errors_classes.dart';
import 'package:projeto2_nicolas/common/patterns/result.dart';
import '../../domain/entities/student_info_entity.dart';
import '../services/local_storage_contract.dart';
import 'student_repository_contract.dart';

class StudentRepositoryImpl implements StudentRepositoryContract {
  final LocalStorageContract _localDataService;

  StudentRepositoryImpl({
    required LocalStorageContract localDataService,
  }) : _localDataService = localDataService;

  @override
  Future<Result<StudentInfoEntity, Failure>> getStudent() async {
    var result = await _localDataService.fetchStudent();
    return result;
  }

  @override
  Future<Result<void, Failure>> saveStudent(StudentInfoEntity student) async {
    var result = await _localDataService.saveStudent(student);
    return result;
  }
}
