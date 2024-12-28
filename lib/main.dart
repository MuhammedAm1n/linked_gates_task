import 'package:flutter/material.dart';
import 'package:linked_gates_task/Core/DI/dependency.dart';
import 'package:linked_gates_task/Core/Routes/routes_manager.dart';
import 'package:linked_gates_task/linkedgates.dart';

void main() {
  setUpGit();
  runApp(LinkedGates(
    routesManager: RoutesManger(),
  ));
}
