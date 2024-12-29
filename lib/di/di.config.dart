// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager/api_manager.dart' as _i1000;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart'
    as _i1036;
import '../data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source_impl.dart'
    as _i978;
import '../data/repositories/auth_repositories_impl/auth_repositories_impl.dart'
    as _i13;
import '../domain/repositories/auth_repository_contract/auth_repository_contract.dart'
    as _i1033;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../features/auth_presentation_screen/login/cubit/login_cubit.dart'
    as _i941;
import '../features/auth_presentation_screen/register/cubit/register_cubit.dart'
    as _i825;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1000.ApiManager>(() => _i1000.ApiManager());
    gh.factory<_i1036.AuthRemoteDataSource>(() =>
        _i978.AuthRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i1033.AuthRepositoryContract>(() => _i13.AuthRepositoriesImpl(
        remoteDataSource: gh<_i1036.AuthRemoteDataSource>()));
    gh.factory<_i772.RegisterUseCase>(() => _i772.RegisterUseCase(
        authRepository: gh<_i1033.AuthRepositoryContract>()));
    gh.factory<_i826.LoginUseCase>(() => _i826.LoginUseCase(
        authRepository: gh<_i1033.AuthRepositoryContract>()));
    gh.factory<_i941.LoginScreenCubit>(
        () => _i941.LoginScreenCubit(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i825.RegisterScreenCubit>(() => _i825.RegisterScreenCubit(
        registerUseCase: gh<_i772.RegisterUseCase>()));
    return this;
  }
}
