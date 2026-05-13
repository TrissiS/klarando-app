enum ApiEnvironment {
  dev,
  test,
  live,
}

const String _envName = String.fromEnvironment('ENV', defaultValue: 'dev');

ApiEnvironment get apiEnvironment {
  switch (_envName.trim().toLowerCase()) {
    case 'live':
      return ApiEnvironment.live;
    case 'test':
      return ApiEnvironment.test;
    case 'dev':
    default:
      return ApiEnvironment.dev;
  }
}

String get defaultApiBaseUrl {
  switch (apiEnvironment) {
    case ApiEnvironment.live:
      return 'https://api.klarando.com/api';
    case ApiEnvironment.test:
      return 'http://31.70.76.55:8080/api';
    case ApiEnvironment.dev:
      return 'http://10.0.2.2:4000/api';
  }
}

String normalizeApiBaseUrl(String value) {
  final trimmed = value.trim();
  final fallback = defaultApiBaseUrl;
  if (trimmed.isEmpty) {
    return _stripApiSuffix(fallback);
  }
  final withoutTrailingSlash =
      trimmed.endsWith('/') ? trimmed.substring(0, trimmed.length - 1) : trimmed;
  return _stripApiSuffix(withoutTrailingSlash);
}

String _stripApiSuffix(String value) {
  if (value.endsWith('/api')) {
    return value.substring(0, value.length - 4);
  }
  return value;
}
