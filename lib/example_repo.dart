class ExampleRepo {
  Future<String> exampleFunction(String str) async {
    await Future.delayed(const Duration(seconds: 3));
    return str;
  }
}
