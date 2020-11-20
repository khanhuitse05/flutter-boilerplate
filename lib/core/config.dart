class Config {
  bool enableCheat;

  Config.dev() {
    enableCheat = true;
  }

  Config.dis() {
    enableCheat = false;
  }
}
