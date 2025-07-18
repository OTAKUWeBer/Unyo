// Application configuration
const String version = 'v1.0.0';
const String applicationSupportDirectory = "applicationSupportDirectory";
const String anilistGraphQlService = 'anilistGraphQlService';
// Anilist API configuration
const String anilistOAuthEndpoint = 'https://anilist.co/api/v2/oauth/token';
const String anilistAuthUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id=$anilistClientId&redirect_uri=$anilistRedirectUri&response_type=code';
const String anilistRedirectUri = 'http://localhost:9999/auth';
const String anilistClientId = '17550';
const String anilistClientSecret = 'xI8KTZlKm2F3kHXLko1ArQ21bKap4MojgDTk6Ukx';
const String anilistGraphQLEndpoint = 'https://graphql.anilist.co';
// Cache configuration
const Set<String> cacheDisabledEndpoints = <String>{
  anilistOAuthEndpoint,
};
const Set<String> cacheIgnoredHeaders = <String>{
  'Authorization'
};

// TODO move to an asset
const plusImageUrl = "https://i.ibb.co/Kj8CQZH/cross.png";