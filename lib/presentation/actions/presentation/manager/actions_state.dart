part of 'actions_cubit.dart';

@immutable
abstract class ActionsState {}

class ActionsInitial extends ActionsState {}

class ShowError extends ActionsState {
  ShowError({required this.message});

  final String message;
}

class Loading extends ActionsState {}

class DisplayFaqs extends ActionsState {
  DisplayFaqs({required this.info});

  final FaqsListModel info;
}

class DisplaySettings extends ActionsState {
  DisplaySettings({required this.info});

  final SettingsModel info;
}
