class SettingsModel {
  final String local;
  final String theme;

  SettingsModel({
    required this.local,
    required this.theme,
  });

  factory SettingsModel.empty() => SettingsModel(
        local: "",
        theme: "",
      );
}
