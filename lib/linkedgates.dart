import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linked_gates_task/Core/Routes/routes.dart';
import 'package:linked_gates_task/Core/Routes/routes_manager.dart';

class LinkedGates extends StatelessWidget {
  final RoutesManger routesManager;

  const LinkedGates({super.key, required this.routesManager});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 917),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Linked Gates',
        onGenerateRoute: routesManager.generateRoute,
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
