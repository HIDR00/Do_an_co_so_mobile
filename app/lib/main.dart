import 'dart:async';

import 'package:app/firebase_options.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:initializer/initializer.dart';
import 'package:shared/shared.dart';

import 'app/bloc/app_bloc.dart';
import 'app/my_app.dart';
import 'config/app_config.dart';

void main() => runZonedGuarded(_runMyApp, _reportError);

Future<void> _runMyApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessagingUtil.enableNotifcation();
  await FirebaseMessagingUtil.onNotificationClick((message) async {
     final AppBloc appBloc = GetIt.instance.get<AppBloc>();
    if(appBloc.state.isLoggedIn){
      await appBloc.navigator.push(const AppRouteInfo.search());
    }else{
      await appBloc.navigator.push(const AppRouteInfo.login());
    }
  },);
  await AppInitializer(AppConfig.getInstance()).init();
  final initialResource = await _loadInitialResource();
  runApp(MyApp(initialResource: initialResource));
}

void _reportError(Object error, StackTrace stackTrace) {
  Log.e(error, stackTrace: stackTrace, name: 'Uncaught exception');

  // report by Firebase Crashlytics here
}

Future<LoadInitialResourceOutput> _loadInitialResource() async {
  final result = runCatching(
    action: () =>
        GetIt.instance.get<LoadInitialResourceUseCase>().execute(const LoadInitialResourceInput()),
  );

  return result.when(
    success: (output) => output,
    failure: (e) => const LoadInitialResourceOutput(),
  );
}
