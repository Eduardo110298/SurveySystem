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
			// console.log($scope.surveys)
		})
		.catch(function(error){

		});
	}
	$scope.traerEncuestas();

	$scope.traerPreguntas = function(){
		$webService.getQuestions($scope.currentSurvey.id)
		.then(function(response){
			console.log(response.data)
			$scope.questions = response.data
		})
		.catch(function(error){
		});
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