class Failures {
  String errorMessage;

  Failures({required this.errorMessage});
}

class ServerFailures extends Failures {
  ServerFailures({required super.errorMessage});
}

class NetworkFailures extends Failures {
  NetworkFailures({required super.errorMessage});
}
