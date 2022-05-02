import 'package:e_invoice_qrcode_reader/core/exports.dart';
import 'package:e_invoice_qrcode_reader/core/fixtures/language_codes.dart';
import 'package:e_invoice_qrcode_reader/core/fixtures/theme_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/actions_cubit.dart';
import '../manager/functions_actions.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with FunctionsActions {
  @override
  Widget build(BuildContext context) {
    var locale = Resources.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.getResource('presentation.actions.settingsHeader')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: BlocBuilder<ActionsCubit, ActionsState>(
          builder: (context, state) {
            if (state is DisplaySettings) {
              return Column(
                children: [
                  _SettingsRow(
                    title:
                        locale.getResource('presentation.actions.appLanguage'),
                    child: DropdownButton<String>(
                      hint: Text(
                        locale.getResource(
                            'core.fixtures.languageCodes.${BlocProvider.of<ActionsCubit>(context).selectedLanguage}'),
                      ),
                      value: BlocProvider.of<ActionsCubit>(context)
                          .selectedLanguage,
                      items: List.generate(
                        LanguageCodes.values.length,
                        (index) => DropdownMenuItem<String>(
                          value: LanguageCodes.values[index],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              locale.getResource(
                                  'core.fixtures.languageCodes.${LanguageCodes.values[index]}'),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ActionsCubit>(context)
                            .selectedLanguage = value ?? "";
                        BlocProvider.of<ActionsCubit>(context).changeLanguage(
                            BlocProvider.of<ActionsCubit>(context)
                                .selectedLanguage);
                      },
                    ),
                  ),
                  _SettingsRow(
                    title: locale.getResource('presentation.actions.appTheme'),
                    child: DropdownButton<String>(
                      hint: Text(
                        locale.getResource(
                            'core.fixtures.ThemeCodes.${BlocProvider.of<ActionsCubit>(context).selectedTheme}'),
                      ),
                      value:
                          BlocProvider.of<ActionsCubit>(context).selectedTheme,
                      items: List.generate(
                        ThemeCodes.values.length,
                        (index) => DropdownMenuItem<String>(
                          value: ThemeCodes.values[index],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              locale.getResource(
                                  'core.fixtures.ThemeCodes.${ThemeCodes.values[index]}'),
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        BlocProvider.of<ActionsCubit>(context).selectedTheme =
                            value ?? "";
                        BlocProvider.of<ActionsCubit>(context).changeTheme(
                            BlocProvider.of<ActionsCubit>(context)
                                .selectedTheme);
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Error Happened"),
              );
            }
          },
        ),
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  const _SettingsRow({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          title,
        )),
        child,
      ],
    );
  }
}
