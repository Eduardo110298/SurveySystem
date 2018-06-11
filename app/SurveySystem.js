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

	this.getSurveys = function(nombre_usuario){
		return $http.get("api/Survey.php?method=getSurveys&nombre_usuario=" + nombre_usuario) //?path=Encuestas
	}

	this.getQuestions = function(id_survey){
		return $http.get("api/Question.php?method=getQuestions&id=" + id_survey)
	}

	this.sendCustomAnswer = function(payload){
		return $http.post("api/Question.php?method=saveCustomAnswer", payload)
	}

	this.sendAnswers = function(payload){
		return $http.post("api/Question.php?method=saveAnswers", payload)
	}

	this.getDoneSurveys = function(user){
		return $http.get("api/Question.php?method=getDoneSurveys&rol=" + user.rol + "&nombre_usuario="+user.nombre_usuario)
	}

	return this;
});
