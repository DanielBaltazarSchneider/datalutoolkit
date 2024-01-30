extension AppString on String? {
  /// Formata para a primeira letra maiuscula e as demais minuscula
  bool isValidStringInput() {
    return this?.trim() != null && this?.trim() != "";
  }
}
