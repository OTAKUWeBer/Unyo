const String version = 'v1.0.0';
const String anilistOAuthEndpoint = 'https://anilist.co/api/v2/oauth/token';
const String anilistClientId = '17550';
const String anilistAuthUrl =
    'https://anilist.co/api/v2/oauth/authorize?client_id=$anilistClientId&redirect_uri=$anilistRedirectUri&response_type=code';
const String anilistRedirectUri = 'http://localhost:9999/auth';
// TODO move to an asset
const plusImageUrl = "https://i.ibb.co/Kj8CQZH/cross.png";