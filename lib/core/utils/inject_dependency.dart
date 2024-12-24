import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/data/repos/search_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );

  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      apiServices: getIt.get<ApiServices>(),
    ),
  );

  getIt.registerSingleton<SearchRepoImp>(
    SearchRepoImp(
      apiServices: getIt.get<ApiServices>(),
    ),
  );
}
