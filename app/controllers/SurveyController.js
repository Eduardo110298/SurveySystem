app.controller("SurveyController", function($scope, $webService, $window, $compile) {
	$scope.currentSurvey = ""
	$scope.traerEncuestas = function(){
		$webService.getSurveys()
		.then(function(response){
			$scope.surveys = []
			if(!Array.isArray(response.data)){
				$scope.surveys.push(response.data)
			}else{
				$scope.surveys = response.data
			}
			console.log($scope.surveys)
		})
		.catch(function(error){

		});
	}
	$scope.traerEncuestas();


	$scope.traerPreguntas = function(){
		$webService.getQuestions($scope.survey.id)
		.then(function(response){
			console.log(response.data)
		})
		.catch(function(error){

		})
	}

	$scope.action = function(survey){
		console.log(survey)
		$scope.currentSurvey = survey
		$webService.getHTML("ParticiparEncuesta")
		.then(function(response){
			document.getElementById("content").innerHTML = response.data
			$compile(document.getElementById("content"))($scope);
			$scope.traerPreguntas()
		})
		.catch(function(error){

		});
	}


});