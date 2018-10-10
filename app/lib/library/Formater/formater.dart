class Formater {
  final String inputVar;

  Formater({this.inputVar});

  factory Formater.input(String string) {
    return Formater(inputVar: string);
  }

  void toThousand() {
    print('toThousand');
    print(this.inputVar);
  }

  void toBillion() {
    print('toBillion');
    print(this.inputVar);
  }
}
