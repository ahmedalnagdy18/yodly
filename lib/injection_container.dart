import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/repositories/forget_password_imp.dart';
import 'package:yodly/features/data/repositories/login_repository_imp.dart';
import 'package:yodly/features/data/repositories/register_repository_imp.dart';
import 'package:yodly/features/domain/repositories/forget_password._repository.dart';
import 'package:yodly/features/domain/repositories/login_repository.dart';
import 'package:yodly/features/domain/repositories/register_repository.dart';
import 'package:yodly/features/domain/usecase/forget_password_usecase.dart';
import 'package:yodly/features/domain/usecase/login_usecase.dart';
import 'package:yodly/features/domain/usecase/register_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Usecases

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));
  sl.registerLazySingleton<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton(() => GraphQLClient(
      link: Link.from([HttpLink("https://yodly.onrender.com/graphql")]),
      cache: GraphQLCache()));
}
