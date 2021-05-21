class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "🇺🇿", "O'zbek (lotin)", "uz"),
      Language(2, "🇷🇺", "Pусский", "ru"),
      Language(3, "🇺🇿", "Ўзбек (кирил)", "en"),
      // Language(4, "🇺🇿", "English", "en"),
    ];
  }
}
