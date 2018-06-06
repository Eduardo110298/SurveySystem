var app = angular.module("SurveySystem",[]);
app.factory("$webService", function($http, $window){
	this.login = function(user){
		return $http.post("api/Usuario.php?method=login", user);
	}
	
	this.logout = function(){
		$window.location.href = "logout.php";
	}

	this.register = function(newUser){
		return $http.post("api/Usuario.php?method=register", newUser);
	}

	return this;
});