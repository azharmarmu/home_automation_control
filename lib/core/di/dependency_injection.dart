import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:home_automation_control/core/sqlite/sqlite_client.dart';
import 'package:home_automation_control/data/data_sources/auth_data_source.dart';
import 'package:home_automation_control/data/repositories/auth_repository.dart';
import 'package:home_automation_control/domain/repositories/auth_repository.dart';
import 'package:home_automation_control/domain/use_cases/log_usecase.dart';
import 'package:home_automation_control/domain/use_cases/signin_usecase.dart';
import 'package:home_automation_control/domain/use_cases/signup_usecase.dart';
import 'package:home_automation_control/presentation/blocs/auth/auth_cubit.dart';
import 'package:home_automation_control/presentation/blocs/auth/form_validation_cubit/form_validation_cubit.dart';
import 'package:package_info/package_info.dart';

final getItInstance = GetIt.I;

Future init() async {
  _configPlugins();
  _dataSources();
  _repositories();
  await _useCases();
  _blocCubit();
}

void _configPlugins() {
  //SQLiteClient
  getItInstance.registerLazySingleton<SQLiteClient>(
    () => SQLiteClient(),
  );
}

void _dataSources() {
  getItInstance.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(getItInstance()),
  );
}

void _repositories() {
  getItInstance.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getItInstance()),
  );
}

Future<void> _useCases() async {
  await _logUC();
  getItInstance.registerLazySingleton<SignInUC>(
    () => SignInUC(getItInstance()),
  );
  getItInstance.registerLazySingleton<SignUpUC>(
    () => SignUpUC(getItInstance()),
  );
}

void _blocCubit() {
  getItInstance.registerSingleton<AuthCubit>(
    AuthCubit(getItInstance(), getItInstance()),
  );

  getItInstance.registerFactory<FormValidationCubit>(
    () => FormValidationCubit(getItInstance()),
  );
}

Future<void> _logUC() async {
  String packageDetails = '';
  if (!kIsWeb) {
    final packageInfo = await PackageInfo.fromPlatform();
    packageDetails = packageInfo.version;
  }

  getItInstance.registerLazySingleton<LogUC>(
    () => LogUC(packageDetails),
  );
}
