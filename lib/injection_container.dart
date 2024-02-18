import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/features/data/repositories/does_verification_exist_imp.dart';
import 'package:yodly/features/data/repositories/forget_password_imp.dart';
import 'package:yodly/features/data/repositories/login_repository_imp.dart';
import 'package:yodly/features/data/repositories/register_repository_imp.dart';
import 'package:yodly/features/data/repositories/send_email_verification_code_imp.dart';
import 'package:yodly/features/data/repositories/verify_user_imp.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';
import 'package:yodly/features/domain/usecase/does_verification_exist_usecase.dart';
import 'package:yodly/features/domain/usecase/forget_password_usecase.dart';
import 'package:yodly/features/domain/usecase/login_usecase.dart';
import 'package:yodly/features/domain/usecase/register_usecase.dart';
import 'package:yodly/features/domain/usecase/send_email_verification_code_usecase.dart';
import 'package:yodly/features/domain/usecase/verify_user_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - auchentication

// Usecases

  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));
  sl.registerLazySingleton<ForgetPasswordUsecase>(
      () => ForgetPasswordUsecase(repository: sl()));

  sl.registerLazySingleton<SendEmailVerificationCodeUsecase>(
      () => SendEmailVerificationCodeUsecase(repository: sl()));

  sl.registerLazySingleton<VerifyUserUsecase>(
      () => VerifyUserUsecase(repository: sl()));

  sl.registerLazySingleton<DoesVerificationExistUsecase>(
      () => DoesVerificationExistUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<ForgetPasswordRepository>(
      () => ForgetPasswordRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<SendEmailVerificationCodeRepository>(
      () => SendEmailVerificationCodeRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<VerifyUserRepository>(
      () => VerifyUserRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<DoesVerificationExistRepository>(
      () => DoesVerificationExistRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton(() => GraphQLClient(
      link: Link.from([HttpLink("https://yodly.onrender.com/graphql")]),
      cache: GraphQLCache()));
}
