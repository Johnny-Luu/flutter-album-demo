class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
