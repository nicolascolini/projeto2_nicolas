import 'package:auto_injector/auto_injector.dart';
import 'package:projeto2_nicolas/data/repository/student_repository_contract.dart';
import 'package:projeto2_nicolas/data/repository/student_repository_impl.dart';
import 'package:projeto2_nicolas/data/services/fake_db_services.dart';
import 'package:projeto2_nicolas/data/services/local_storage_contract.dart';
import 'package:projeto2_nicolas/ui/pages/home_page.dart';

final injector = AutoInjector();

void setupDependencies() {
  injector.addSingleton<StudentRepositoryContract>(StudentRepositoryImpl.new);
  //injector.addSingleton<LocalStorageContract>(SharedPrefService.new);
  injector.addSingleton<LocalStorageContract>(FakeDbService.new);
  injector.addSingleton(HomePageController.new);
  injector.commit();
}
