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
import '../data/data_sources/remote_data_source/cart_remote_data_source/cart_remote_data_source.dart'
    as _i963;
import '../data/data_sources/remote_data_source/cart_remote_data_source/cart_remote_data_source_impl.dart'
    as _i226;
import '../data/data_sources/remote_data_source/home_screen_remote_data_source/home_screen_remote_data_source.dart'
    as _i154;
import '../data/data_sources/remote_data_source/home_screen_remote_data_source/home_screen_remote_data_source_impl.dart'
    as _i1013;
import '../data/data_sources/remote_data_source/update_user_remote_date_source/update_user_remote_date_source.dart'
    as _i995;
import '../data/data_sources/remote_data_source/update_user_remote_date_source/update_user_remote_date_source_impl.dart'
    as _i65;
import '../data/repositories/auth_repository_impl/auth_repositories_impl.dart'
    as _i674;
import '../data/repositories/cart_repository_impl/cart_repository_impl.dart'
    as _i685;
import '../data/repositories/home_screen_repository_impl/home_screen_repository_impl.dart'
    as _i529;
import '../data/repositories/update_user_repository_impl/update_user_repository_impl.dart'
    as _i219;
import '../domain/repositories/auth_repository_contract.dart' as _i665;
import '../domain/repositories/cart_repository_contract.dart' as _i942;
import '../domain/repositories/home_screen_repository_contract.dart' as _i717;
import '../domain/repositories/update_user_repository_contract.dart' as _i721;
import '../domain/use_cases/add_to_cart_use_case.dart' as _i994;
import '../domain/use_cases/delete_item_in_cart_use_case.dart' as _i1013;
import '../domain/use_cases/get_all_brands_use_case.dart' as _i823;
import '../domain/use_cases/get_all_categories_use_case.dart' as _i557;
import '../domain/use_cases/get_all_products_use_case.dart' as _i960;
import '../domain/use_cases/get_cart_use_case.dart' as _i487;
import '../domain/use_cases/login_use_case.dart' as _i826;
import '../domain/use_cases/register_use_case.dart' as _i772;
import '../domain/use_cases/update_count_in_cart_use_case.dart' as _i668;
import '../domain/use_cases/update_user_use_case.dart' as _i786;
import '../features/auth_presentation_screen/login/cubit/login_cubit.dart'
    as _i941;
import '../features/auth_presentation_screen/register/cubit/register_cubit.dart'
    as _i825;
import '../features/cart/cubit/cart_screen_cubit.dart' as _i1069;
import '../features/main_layout/home_tab/cubit/home_tab_cubit.dart' as _i748;
import '../features/main_layout/products_screen/cubit/product_screen_cubit.dart'
    as _i567;
import '../features/main_layout/profile_tab/cubit/profile_tab_cubit.dart'
    as _i47;

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
    gh.factory<_i995.UpdateUserDateSource>(() =>
        _i65.UpdateUserDateSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i154.HomeScreenRemoteDataSource>(() =>
        _i1013.HomeScreenRemoteDataSourceImpl(
            apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i1036.AuthRemoteDataSource>(() =>
        _i978.AuthRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i963.CartRemoteDataSource>(() =>
        _i226.CartRemoteDataSourceImpl(apiManager: gh<_i1000.ApiManager>()));
    gh.factory<_i717.HomeScreenRepositoryContract>(() =>
        _i529.HomeScreenRepositoryImpl(
            remoteDataSource: gh<_i154.HomeScreenRemoteDataSource>()));
    gh.factory<_i994.AddToCartUseCase>(() => _i994.AddToCartUseCase(
        homeScreenRepository: gh<_i717.HomeScreenRepositoryContract>()));
    gh.factory<_i823.GetAllBrandsUseCase>(() => _i823.GetAllBrandsUseCase(
        homeScreenRepository: gh<_i717.HomeScreenRepositoryContract>()));
    gh.factory<_i557.GetAllCategoriesUseCase>(() =>
        _i557.GetAllCategoriesUseCase(
            homeScreenRepository: gh<_i717.HomeScreenRepositoryContract>()));
    gh.factory<_i960.GetAllProductsUseCase>(() => _i960.GetAllProductsUseCase(
        homeScreenRepository: gh<_i717.HomeScreenRepositoryContract>()));
    gh.factory<_i721.UpdateUserRepositoryContract>(() =>
        _i219.UpdateUserRepositoryImpl(
            updateUserDateSource: gh<_i995.UpdateUserDateSource>()));
    gh.factory<_i665.AuthRepositoryContract>(() => _i674.AuthRepositoriesImpl(
        remoteDataSource: gh<_i1036.AuthRemoteDataSource>()));
    gh.factory<_i786.UpdateUserUseCase>(() => _i786.UpdateUserUseCase(
        updateUserRepository: gh<_i721.UpdateUserRepositoryContract>()));
    gh.factory<_i567.ProductScreenCubit>(() => _i567.ProductScreenCubit(
          productsUseCase: gh<_i960.GetAllProductsUseCase>(),
          addToCartUseCase: gh<_i994.AddToCartUseCase>(),
        ));
    gh.factory<_i826.LoginUseCase>(() =>
        _i826.LoginUseCase(authRepository: gh<_i665.AuthRepositoryContract>()));
    gh.factory<_i772.RegisterUseCase>(() => _i772.RegisterUseCase(
        authRepository: gh<_i665.AuthRepositoryContract>()));
    gh.factory<_i942.CartRepositoryContract>(() => _i685.CartRepositoryImpl(
        remoteDataSource: gh<_i963.CartRemoteDataSource>()));
    gh.factory<_i748.HomeTabCubit>(() => _i748.HomeTabCubit(
          getAllCategoriesUseCase: gh<_i557.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i823.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i487.GetCartUseCase>(() => _i487.GetCartUseCase(
        cartRepositoryContract: gh<_i942.CartRepositoryContract>()));
    gh.factory<_i1013.DeleteItemInCartUseCase>(() =>
        _i1013.DeleteItemInCartUseCase(
            cartRepositoryContract: gh<_i942.CartRepositoryContract>()));
    gh.factory<_i668.UpdateCountInCartUseCase>(() =>
        _i668.UpdateCountInCartUseCase(
            cartRepositoryContract: gh<_i942.CartRepositoryContract>()));
    gh.factory<_i825.RegisterScreenCubit>(() => _i825.RegisterScreenCubit(
        registerUseCase: gh<_i772.RegisterUseCase>()));
    gh.factory<_i47.ProfileTabScreenCubit>(() => _i47.ProfileTabScreenCubit(
        updateUserUseCase: gh<_i786.UpdateUserUseCase>()));
    gh.factory<_i941.LoginScreenCubit>(
        () => _i941.LoginScreenCubit(loginUseCase: gh<_i826.LoginUseCase>()));
    gh.factory<_i1069.CartScreenCubit>(() => _i1069.CartScreenCubit(
          getCartUseCase: gh<_i487.GetCartUseCase>(),
          deleteItemInCartUseCase: gh<_i1013.DeleteItemInCartUseCase>(),
          updateCountInCartUseCase: gh<_i668.UpdateCountInCartUseCase>(),
        ));
    return this;
  }
}
