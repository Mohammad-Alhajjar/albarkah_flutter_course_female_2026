// ignore_for_file: unnecessary_this

extension TempretureValuesHelper on double {
  bool isCritical() {
    if (this > 38.0) {
      return true;
    }
    return false;
  }

  String printTempInC() {
    return "${this.toStringAsFixed(1)}°C";
  }
}
