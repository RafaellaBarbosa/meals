class Settings {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegan;
  bool isVegetarian;
  bool isDarkMode;
  bool isNotificationsEnabled;

  Settings({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isDarkMode = false,
    this.isNotificationsEnabled = false,
  });
}
