import 'package:get_it/get_it.dart';
import 'package:quest_signin_dashboard/features/signin/data/datasource/remote_datasource.dart';
import 'package:quest_signin_dashboard/features/signin/data/repository/signin_repository_impl.dart';
import 'package:quest_signin_dashboard/features/signin/domain/repository/sigin_repository.dart';
import 'package:quest_signin_dashboard/features/signin/domain/usecases/dual_user_signin.dart';
import 'package:quest_signin_dashboard/features/signin/domain/usecases/single_user_signin.dart';
import 'package:quest_signin_dashboard/features/signin/presentation/bloc/signin_bloc.dart';

final serviceLocator = GetIt.instance;

void initDependencies() {
  _initSignin();
}

void _initSignin() {
  serviceLocator.registerFactory<SigninRemoteDatasource>(
      () => SigninRemoteDatasourceImpl());

  serviceLocator.registerFactory<SigninRepository>(
    () => SigninRepositoryImpl(signinRemoteDatasource: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => SingleUserSignin(signinRepository: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => DualUserSignin(signinRepository: serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => SigninBloc(
        singleUserSignin: serviceLocator(), dualUserSignin: serviceLocator()),
  );
}
