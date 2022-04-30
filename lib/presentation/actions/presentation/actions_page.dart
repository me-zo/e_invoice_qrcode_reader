import 'package:e_invoice_qrcode_reader/presentation/actions/presentation/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/actions_cubit.dart';
import 'manager/functions_actions.dart';
import 'screens/faqs.dart';

enum ActionName { faqs, settings }

class ActionsPage extends StatefulWidget {
  const ActionsPage({
    Key? key,
    required this.action,
  }) : super(key: key);
  static const routeName = "/ActionsPage";
  final ActionName action;

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> with FunctionsActions {
  @override
  void initState() {
    switch (widget.action) {
      case ActionName.faqs:
        BlocProvider.of<ActionsCubit>(context).prepareFaqs();
        break;
      case ActionName.settings:
        BlocProvider.of<ActionsCubit>(context).prepareSettings();
        break;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.action) {
      case ActionName.faqs:
        return Faqs();
      case ActionName.settings:
        return const Settings();
      default:
        return const Scaffold(
          body: Center(
            child: Text("Error Happened"),
          ),
        );
    }
  }
}
