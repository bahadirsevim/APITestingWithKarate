function() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'test';
  }

    if (env == 'test') {
      testEnvUrl = 'https://jsonplaceholder.typicode.com/posts'
    } else if (env == 'dev') {
      testEnvUrl = 'https://jsonplaceholder.typicode.com/posts'
    }

  var config = {
    env: env,
	myBaseUrl: testEnvUrl
  }
  //karate.configure('ssl', true);
  //karate.configure('proxy', 'http://127.0.0.1:8080');
  //karate.configure('ssl', 'TLSv1.2');
  karate.configure('connectTimeout', 60000);
  karate.configure('readTimeout', 120000)
  return config;
}