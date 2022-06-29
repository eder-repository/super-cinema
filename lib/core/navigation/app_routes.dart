import 'package:flutter/cupertino.dart';
import 'package:super_cinema/core/navigation/routes.dart';
import 'package:super_cinema/features/home/presentation/screen/home.dart';

Map<String, Widget Function(BuildContext)> get appRoutes =>
    {AppRoutes.home: (_) => const HomeScreen()};
