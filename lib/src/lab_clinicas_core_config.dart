import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_locader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
// import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  // intancias/dependencias disponíveis para app inteira
  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  final List<FlutterGetItModule>? modules;
  final String title;

  const LabClinicasCoreConfig({
    super.key,
    required this.title,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.modules,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: binding,
      pages: [...pages ?? [], ...pagesBuilders ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLocader(),
          builder: (navigatorObserver) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
              ],
              routes: routes,
              title: title,
            );
          },
        );
      },
    );
  }
}
