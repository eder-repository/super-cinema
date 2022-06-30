import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_cinema/core/navigation/app_routes.dart';
import 'package:super_cinema/core/navigation/routes.dart';
import 'package:super_cinema/features/buy/presentation/screen/cubit/buy_cubit.dart';
import 'package:super_cinema/features/home/presentation/bloc/home_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..init()),
        BlocProvider(create: (_) => BuyCubit())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        routes: appRoutes,
      ),
    );
  }
}
