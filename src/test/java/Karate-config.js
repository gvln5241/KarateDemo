function fn() {

	var config = {
		name: "VG",
		baseURL: "none"
	};

	var env = karate.env
	karate.log('THe value of env is : ', env);


	if (env == 'qa') {
		config.baseURL = "https://reqres.in/api"
	}
	else if (env == 'dev') {
		config.baseURL = "https://reqres.in/api/dev"
	}
	karate.configure('connectTimeout', 5000);
	karate.configure('readTimeout', 5000);
	return config
}