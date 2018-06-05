var app = angular.module("SurveySystem",[]);
app.factory("$webService", function($http, $window){
	this.login = function(user){
		return $http.post("api/Login.php", user);
	}
	
	this.logout = function(){
		$window.location.href = "logout.php";
	}

	return this;
});