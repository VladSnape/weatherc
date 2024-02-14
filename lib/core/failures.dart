abstract class Failure {}

class ServerFailure extends Failure {
  final int statusCode;

  ServerFailure(this.statusCode);
}

class Efailure extends Failure {
  final String e;

  Efailure(this.e);
}

class ServerException implements Exception {
  int statusCode;
  ServerException({
    required this.statusCode,
  });
}

class EException implements Exception {
  String e;
  EException({
    required this.e,
  });
}
