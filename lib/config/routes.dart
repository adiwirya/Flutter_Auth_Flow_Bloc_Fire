// ignore_for_file: public_member_api_docs, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_authentication_flow_builder_bloc/blocs/app/app_bloc.dart';
import 'package:flutter_authentication_flow_builder_bloc/screens/screens.dart';

List<Page> OnGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
