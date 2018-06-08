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

	this.validateUser = function(data){
		return $http.post("api/Usuario.php?method=validateUser", data);
	}

	this.validateAnswer = function(data){
		return $http.post("api/Usuario.php?method=validateAnswer", data);
	}
	this.setPassword = function(data){
		return $http.post("api/Usuario.php?method=setPassword", data);
	}

	this.getHTML = function(path){
		return $http.get("api/Router.php?path=" + path) //?path=Encuestas
	}

	this.updateUser = function(data){
		return $http.post("api/Usuario.php?method=updateUser", data);
	}

	this.getSurveys = function(){
		return $http.get("api/Survey.php?method=getSurveys") //?path=Encuestas
	}

	this.getQuetions = function(id_question){
		return $http.get("api/Question.php?method=getQuestions&id="+id_question)
	}

	return this;
});
