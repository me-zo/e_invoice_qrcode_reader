import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/widgets/app_alert_dialogs.dart';
import 'manager/about_cubit.dart';
import 'manager/functions_about.dart';
import 'screens/contact_us.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/AboutPage";

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with FunctionsAbout {
  @override
  void initState() {
    BlocProvider.of<AboutCubit>(context).prepareSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: ContactUs(),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: IconButton(
          onPressed: () {
            AppAlertDialog.confirmationDialog(
              context,
              message: "Clear History",
              onCancel: () => Navigator.of(context).pop(),
              onNext: () {
                BlocProvider.of<AboutCubit>(context).changeTheme();
                Navigator.of(context).pop();
              },
            );
          },
          icon: const Icon(
            Icons.clear_all,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
