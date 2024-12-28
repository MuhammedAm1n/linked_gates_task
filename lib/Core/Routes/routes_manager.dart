import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linked_gates_task/Core/DI/dependency.dart';
import 'package:linked_gates_task/Core/Routes/routes.dart';
import 'package:linked_gates_task/Features/Home/Logic/cubit/getproducts_cubit.dart';
import 'package:linked_gates_task/Features/Home/homepage.dart';

class RoutesManger {
  Route? generateRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIT<GetproductsCubit>(),
            child: const Homepage(),
          ),
        );
     

      default:
        return null;
    }
  }
}
