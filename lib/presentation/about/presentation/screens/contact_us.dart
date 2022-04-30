import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/about_cubit.dart';
import '../manager/functions_about.dart';

class ContactUs extends StatelessWidget with FunctionsAbout {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutCubit, AboutState>(
      builder: (context, state) {
        return const Center(
          child: Text("This feature is not implemented yet"),
        );
      },
    );
  }
}
