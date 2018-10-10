abstract class Model {
  String data;

  Model({this.data});

  void test() {
    print(data);
  }
}

class A extends Model {
  String data;
  A({this.data}) : super(data: data);
}

var a = new A().test();
