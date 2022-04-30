import 'package:e_invoice_qrcode_reader/app/localization/resources.dart';
import 'package:e_invoice_qrcode_reader/presentation/actions/domain/models/faqs_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/actions_cubit.dart';
import '../manager/functions_actions.dart';

class Faqs extends StatelessWidget with FunctionsActions {
  const Faqs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Resources.of(context).getResource("presentation.actions.faqsHeader"))),
      body: BlocBuilder<ActionsCubit, ActionsState>(
        builder: (context, state) {
          if (state is DisplayFaqs) {
            return state.info.questions.isEmpty
                ? const Center(
                    child: Text(
                      "No Questions Yet!",
                    ),
                  )
                : ListView.separated(
                    itemCount: state.info.questions.length,
                    separatorBuilder: (context, index) {
                      return const Divider(thickness: 2);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(1, 3),
                                blurRadius: 5,
                                color: Colors.white,
                              ),
                              BoxShadow(
                                offset: Offset(-2, -1),
                                blurRadius: 3,
                                color: Colors.black87,
                              ),
                            ],
                            color: Colors.grey.shade700),
                        child: _FaqsQuestion(
                          question: state.info.questions[index],
                        ),
                      );
                    },
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

class _FaqsQuestion extends StatelessWidget {
  final FaqsQuestionModel question;

  const _FaqsQuestion({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
