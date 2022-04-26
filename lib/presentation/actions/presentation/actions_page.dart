import '../../../core/common/widgets/app_alert_dialogs.dart';
import 'manager/actions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/functions_actions.dart';
import 'screens/faqs.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({
    Key? key,
  }) : super(key: key);
  static const routeName = "/ActionsPage";

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> with FunctionsActions {
  @override
  void initState() {
    BlocProvider.of<ActionsCubit>(context).prepareSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Faqs(),
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
                BlocProvider.of<ActionsCubit>(context).changeTheme();
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
