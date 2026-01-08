
abstract class Failure{
  String message;
  Failure(this.message);
}

class NetWorkFailuer extends Failure{
  NetWorkFailuer(super.message);
}

class ServerFailuer extends Failure{
  ServerFailuer(super.message);
}