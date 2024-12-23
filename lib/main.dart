import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/core/utils/inject_dependency.dart';
import 'package:bookly/features/home/data/repos/home_repo_imp.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return FeaturedBooksCubit(getIt.get<HomeRepoImp>())
                ..fetchFeaturedBooks();
            },
          ),
          BlocProvider(
            create: (context) {
              return NewestBooksCubit(
                getIt.get<HomeRepoImp>(),
              )..fetchNewestBooks();
            },
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryBackgroundColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
              appBarTheme:
                  const AppBarTheme(backgroundColor: Colors.transparent)),
          debugShowCheckedModeBanner: false,
        ));
  }
}
