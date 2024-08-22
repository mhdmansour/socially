import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:socially_app/catalog/infrastructure/data_source/auth/auth_remote_data_source.dart';
import 'package:socially_app/catalog/navigation/navigation_service.dart';
import 'package:socially_app/catalog/service/network/dio_network_service.dart';

import '../catalog/infrastructure/repository/auth/auth_repository.dart';
import '../catalog/view/profile/bloc/login_bloc.dart';

final getIt = GetIt.instance;

Future init() async {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerSingleton<DioNetworkService>(
    DioNetworkService(),
  );

  getIt.registerLazySingleton<Dio>(
        () => getIt<DioNetworkService>().dio,
  );


  ///data sources
  getIt.registerLazySingleton(() => AuthRemoteDataSource(getIt()));


  ///Infrastructure Layer - repositories
  getIt.registerLazySingleton(() => AuthRepository(getIt()));


  ///Presentation Layer - Blocs
  getIt.registerFactory(() => LoginBloc(authRepository: getIt()));

}


