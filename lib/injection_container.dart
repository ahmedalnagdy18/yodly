import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:yodly/core/shared_prefrances/shared_prefrance.dart';
import 'package:yodly/features/data/repositories/add_review/add_service_repository_imp.dart';
import 'package:yodly/features/data/repositories/add_review/upload_file_repository_imp.dart';
import 'package:yodly/features/data/repositories/authentication/does_verification_exist_imp.dart';
import 'package:yodly/features/data/repositories/authentication/forget_password_imp.dart';
import 'package:yodly/features/data/repositories/authentication/login_repository_imp.dart';
import 'package:yodly/features/data/repositories/authentication/register_repository_imp.dart';
import 'package:yodly/features/data/repositories/authentication/send_email_verification_code_imp.dart';
import 'package:yodly/features/data/repositories/authentication/verify_user_imp.dart';
import 'package:yodly/features/data/repositories/home/reviews_repository_imp.dart';
import 'package:yodly/features/domain/repositories/add_review/add_review_repository.dart';
import 'package:yodly/features/domain/repositories/authentication/authentication_repository.dart';
import 'package:yodly/features/domain/repositories/home/home_repository.dart';
import 'package:yodly/features/domain/usecase/add_review/add_review_usecase.dart';
import 'package:yodly/features/domain/usecase/add_review/add_service_usecase.dart';
import 'package:yodly/features/domain/usecase/add_review/upload_file_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/does_verification_exist_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/forget_password_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/login_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/register_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/send_email_verification_code_usecase.dart';
import 'package:yodly/features/domain/usecase/authentication/verify_user_usecase.dart';
import 'package:yodly/features/domain/usecase/home/delete_usecase.dart';
import 'package:yodly/features/domain/usecase/home/reviews_usecase.dart';

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

  sl.registerLazySingleton<ReviewsUsecase>(
      () => ReviewsUsecase(repository: sl()));

  sl.registerLazySingleton<AddReviewUsecase>(
      () => AddReviewUsecase(repository: sl()));

  sl.registerLazySingleton<AddServiceUsecase>(
      () => AddServiceUsecase(repository: sl()));

  sl.registerLazySingleton<DeleteReviewUsecase>(
      () => DeleteReviewUsecase(repository: sl()));

  sl.registerLazySingleton<UploadFileUsecase>(
      () => UploadFileUsecase(repository: sl()));

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

  sl.registerLazySingleton<ReviewsRepository>(
      () => ReviewsRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<AddServiceRepository>(
      () => AddServiceRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<UploadFileRepository>(
      () => UploadFileRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<GraphQLClient>(() {
    final authLink = AuthLink(getToken: () async {
      final token = await getToken();
      return "Bearer " + token;
    });

    final httpLink = HttpLink("https://yodly.onrender.com/graphql");

    return GraphQLClient(
      link: authLink.concat(httpLink),
      cache: GraphQLCache(),
    );
  });
}

Future<String> getToken() async {
  return SharedPrefrance.instanc.getToken('token') ?? '';
}
