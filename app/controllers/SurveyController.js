app.controller("SurveyController", function($scope, $webService, $window, $compile, $rootScope) {
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

	$scope.data = {
		customAnswer: ""
	}

	$scope.submit = function(){
		var payload = {
			comb: jQuery("form#survey").serialize().split("&").map((x) => x.split("=")).map((x) => x[1]).join(),
			resp: $scope.data.customAnswer,
			repe: false,
			survey_id: $scope.currentSurvey.id,
			user_id: $rootScope.userData.id
		}
		if($rootScope.userData.rol == "administrador"){
			$webService.sendCustomAnswer(payload)
			.then(function(response){
				if(response.data.repeated){
					if(confirm("La combinación introducida ya fue registrada, ¿desea sobreescribirla?")){
						if(confirm("¿Está seguro?")){
							payload.repe = true
							$webService.sendCustomAnswer(payload)
							.then(function(response){
								if (response.data.success) {
									alert("Datos Guardados!")	
								}
							})
							.catch(function(error){
							})
						}
					}
				}else{
					if (response.data.success) {
						alert("Datos Guardados!")	
					}
				}
			})
			.catch(function(error){

			})
		}else{
			$webService.sendAnswers(payload)
			.then(function(response){
				console.log(response.data)
			})
			.catch(function(error){
			});
		}
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