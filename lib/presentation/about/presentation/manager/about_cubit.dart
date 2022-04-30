import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/service/about_service.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  final AboutService aboutService;

  AboutCubit({required this.aboutService}) : super(AboutInitial());
}
