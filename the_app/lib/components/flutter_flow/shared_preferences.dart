class SharedPreferences {
  bool mode = true;
  static getInstance() {
    return SharedPreferences();
  }

  getBool(String kThemeModeKey) { return true;}

  remove(String kThemeModeKey) {}

  setBool(String kThemeModeKey, bool bool) {mode = bool;}
}