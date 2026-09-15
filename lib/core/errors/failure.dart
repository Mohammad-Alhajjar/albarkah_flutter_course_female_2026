abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({super.message = "failed to connect server ... "});
}

class OfflineFailure extends Failure {
  OfflineFailure({
    super.message = "chaeck your internet connection and try again ...",
  });
}

class CacheFailure extends Failure {
  CacheFailure({super.message = "therer is no data in cached ..."});
}
