import 'package:flutter/material.dart';
import 'package:projeto2_nicolas/common/errors/errors_classes.dart';
import 'package:projeto2_nicolas/common/patterns/command.dart';
import 'package:projeto2_nicolas/common/patterns/result.dart';
import 'package:projeto2_nicolas/data/repository/student_repository_contract.dart';
import 'package:projeto2_nicolas/domain/entities/student_info_entity.dart';

class HomePageController extends ChangeNotifier {
  HomePageController({
    required StudentRepositoryContract studentRepository,
  }) : _studentRepository = studentRepository {
    load = Command0<StudentInfoEntity, Failure>(_load);
    saveStudent = Command1(_saveStudent);
    loadSample = Command0<void, void>(_resetToStudentInfo);
  }

  final StudentRepositoryContract _studentRepository;
  StudentInfoEntity? _student;

  late Command0<void, void> loadSample;
  late Command0<StudentInfoEntity, Failure> load;
  late Command1<void, Failure, StudentInfoEntity> saveStudent;

  StudentInfoEntity? get student => _student;
  Future<Result<StudentInfoEntity, Failure>> _load() async {
    final result = await _studentRepository.getStudent();

    result.fold(
      onSuccess: (student) => _student = student as StudentInfoEntity?,
      onFailure: (error) => _student = StudentInfoEntity.sampleInfo(),
    );

    notifyListeners();
    return result;
  }

  Future<Result<void, Failure>> _saveStudent(StudentInfoEntity student) async {
    final result = await _studentRepository.saveStudent(student);
  
  if (result.isFailure) {
    debugPrint(
      'Error loading student: $(result.failureValueOrNull)',
    );

  } else {
  _student = student;
  }

  notifyListeners();
  return result;
}

Future<Result<void, void>> _resetToStudentInfo() async  {

  _student = StudentInfoEntity.sampleInfo();
  notifyListeners();
  return const Success(null);
}
}
