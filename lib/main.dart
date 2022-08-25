// ignore_for_file: public_member_api_docs

import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_flow_builder_bloc/bloc_observer.dart';
import 'package:flutter_authentication_flow_builder_bloc/blocs/blocs.dart';
import 'package:flutter_authentication_flow_builder_bloc/config/routes.dart';
import 'package:flutter_authentication_flow_builder_bloc/firebase_options.dart';
import 'package:flutter_authentication_flow_builder_bloc/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepository = AuthRepository();
  Bloc.observer = AppBlocObserver();
  runApp(
    App(
      authRepository: authRepository,
    ),
  );
}

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);
  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlowBuilder(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: OnGenerateAppViewPages,
      ),
    );
  }
}
