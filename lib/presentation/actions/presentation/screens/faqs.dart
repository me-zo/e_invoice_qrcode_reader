import 'package:e_invoice_qrcode_reader/app/localization/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/actions_cubit.dart';
import '../manager/functions_actions.dart';

class Faqs extends StatefulWidget with FunctionsActions {
  const Faqs({Key? key}) : super(key: key);

  @override
  State<Faqs> createState() => _FaqsState();
}

class _FaqsState extends State<Faqs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Resources.of(context).getResource("presentation.actions.faqsHeader"),
        ),
      ),
      body: BlocBuilder<ActionsCubit, ActionsState>(
        builder: (context, state) {
          if (state is DisplayFaqs) {
            return state.info.questions.isEmpty
                ? const Center(
                    child: Text(
                      "No Questions Yet!",
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(2, 2),
                          blurRadius: 3,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        BoxShadow(
                          offset: const Offset(-2, -2),
                          blurRadius: 3,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ],
                      color: Theme.of(context).cardColor,
                    ),
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ExpansionPanelList(
                          elevation: 0,
                          expansionCallback: (index, isExpanded) {
                            setState(
                              () {
                                BlocProvider.of<ActionsCubit>(context)
                                    .faqsIsExpanded[index] = !isExpanded;
                              },
                            );
                          },
                          children: List.generate(
                            state.info.questions.length,
                            (index) => ExpansionPanel(
                              headerBuilder: (context, expanded) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text( Resources.of(context).getResource(state.info.questions[index].title),
                                style: BlocProvider.of<ActionsCubit>(context)
                                    .faqsIsExpanded[index] ? TextStyle(color: Theme.of(context).colorScheme.secondary) : null,),
                              ),
                              body: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(Resources.of(context).getResource(state.info.questions[index].answer)),
                              ),
                              isExpanded: BlocProvider.of<ActionsCubit>(context)
                                  .faqsIsExpanded[index],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
          } else {
            return const Center(
              child: Text("Error Happened"),
            );
          }
        },
      ),
    );
  }
}
