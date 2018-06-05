var app = angular.module("SurveySystem",[]);
app.factory("$webService", function($http){
	this.login = function(username, password){
		var body = {
			user: username,
			pass: password
		}
		return $http.post("api/Login.php", body)
	}
	return this;
});