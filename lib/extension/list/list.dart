extension AppList on List {
  List<List> splitList(int length) {
    List<List> finalList = [];
    int itens = (this.length ~/ length) + 1;
    for (int i = 0; i < itens; i++) {
      List splited = sublist(i * length, ((i * length) + length) <= this.length ? (i * length) + length : this.length);
      if (splited.isNotEmpty) {
        finalList.add(splited);
      }
    }
    return finalList;
  }
}
