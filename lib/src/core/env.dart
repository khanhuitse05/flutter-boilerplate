class _ENV {
  late bool enableCheat;

  // ignore: unused_element
  _ENV.dev() {
    enableCheat = true;
  }

  // ignore: unused_element
  _ENV.dis() {
    enableCheat = false;
  }
}

_ENV env = _ENV.dev();
