app.controller("SurveyController", function($scope, $webService, $window, $compile) {
	$scope.traerEncuestas = function(){
		$webService.getSurveys()
		.then(function(response){
			$scope.surveys = []
			if(!Array.isArray(response.data)){
				$scope.surveys.push(response.data)
			}else{
				$scope.surveys = response.data
			}
		})
		.catch(function(error){

		});
	}
	$scope.traerEncuestas();

	$scope.traerPreguntas = function(){
		$webService.getQuestions($scope.currentSurvey.id)
		.then(function(response){
			$scope.questions = response.data
		})
		.catch(function(error){
		});
	}

	$scope.submit = function(){
		console.log(jQuery("form#survey").serialize().split("&").map((x) => x.split("=")).map((x) => x[1]).join())
	}

	$scope.action = function(survey){
		$scope.currentSurvey = survey
		$webService.getHTML("ParticiparEncuesta")
		.then(function(response){
			$scope.traerPreguntas()
			document.getElementById("content").innerHTML = response.data
			$compile(document.getElementById("content"))($scope);
		})
		.catch(function(error){

		});
	}


});