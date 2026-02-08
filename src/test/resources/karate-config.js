function fn() {
  var env = karate.env || 'dev';

  var config = {
    baseUrl: 'https://sendgrid-v3-api.mock.beeceptor.com'
  };

  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);

  return config;
}
