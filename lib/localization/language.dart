class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "๐บ๐ฟ", "Uzbek", "uz"),
      Language(2, "๐ท๐บ", "Pัััะบะธะน", "ru"),
      // Language(4, "๐บ๐ฟ", "English", "en"),
    ];
  }
}
