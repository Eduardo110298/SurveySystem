app.controller("SurveyController", function($scope, $webService, $window, $compile, $rootScope) {
	$scope.traerEncuestas = function(){
		$webService.getSurveys($rootScope.userData.nombre_usuario)
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
		customTitle:""
	}

	$scope.submit = function(){
		var payload = {
			comb: jQuery("form#survey").serialize().split("&").map((x) => x.split("=")).map((x) => x[1]).join(),
			resp: $scope.data.customAnswer,
			repe: false,
			survey_id: $scope.currentSurvey.id,
			user_id: $rootScope.userData.nombre_usuario
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
									$window.location.href = "/SurveySystem/"
								}
							})
							.catch(function(error){
							})
						}
					}
				}else{
					if (response.data.success) {
						alert("Datos Guardados!")	
						$window.location.href = "/SurveySystem/"
					}
				}
			})
			.catch(function(error){

			})
		}else{
			$webService.sendAnswers(payload)
			.then(function(response){
				console.log(response.data)
				alert("Datos Guardados!")
				try{
					var textoBruto = response.data
					$scope.data.customTitle = JSON.parse(textoBruto.split("\\n")[0] + "\"")
					textoBruto = textoBruto.split("\\n")
					textoBruto.shift()
					textoBruto = "\"" + textoBruto.join("\\n")
					// console.log(textoBruto)
					jQuery("#response p")[1].innerText = JSON.parse(textoBruto).substr(0, textoBruto.length - 2)
					jQuery("#survey").slideToggle();
					jQuery("#response").slideToggle();
			 	}
				catch(error){
					console.log(error.message)
				}
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


	$scope.getDoneSurveys = function(){
		$webService.getDoneSurveys($rootScope.userData)
		.then(function(response){
			$scope.doneSurveys = []
			if(!Array.isArray(response.data)){
				if(response.data != "false") $scope.doneSurveys.push(response.data)
			}else{
				$scope.doneSurveys = response.data
			}
		})
		.catch(function(error){

		});
	}
	$scope.getDoneSurveys()


	$scope.traerResultados = function(){
		$webService.getSurveyResult($scope.currentDetailSurvey)
		.then(function(response){
			// console.log(response.data)
			try	{
			$scope.questions = response.data.res
			var textoBruto = JSON.stringify(response.data.intervencion)
			// console.log(textoBruto.split("\\n"))
			// console.log(JSON.parse(textoBruto.split("\\n")[0] + "\""))
			jQuery("#intervencion p b")[0].innerText = decodeURIComponent(escape(textoBruto.split("\\n")[0])).substr(1)
			textoBruto = textoBruto.split("\\n")
			textoBruto.shift()
			textoBruto = "\"" + textoBruto.join("\\n")
			jQuery("#intervencion p")[1].innerText = decodeURIComponent(escape(JSON.parse(textoBruto).substr(0, textoBruto.length - 2)))
		}catch(e){
			console.log(e.message)
		}
		})
		.catch(function(error){
		})
	}

	$scope.viewDetails = function(survey){
		$scope.currentDetailSurvey = survey
		$webService.getHTML("DetallesEncuesta")
		.then(function(response){
			$scope.traerResultados()
			document.getElementById("content").innerHTML = response.data
			$compile(document.getElementById("content"))($scope);
		})
		.catch(function(error){

		})
	}

	$scope.viewComb = function(combination){
		$scope.currentDetailCombination = combination
		$webService.getHTML("DetallesCombinaciones")
		.then(function(response){
			$scope.traerCombs()
			document.getElementById("content").innerHTML = response.data
			$compile(document.getElementById("content"))($scope);
		})
		.catch(function(error){
		})
	}

	$scope.traerCombs = function(){
		$webService.getCombinationResult($scope.currentDetailCombination)
		.then(function(response){
			console.log(response.data)
			$scope.preguntas = response.data.res
			try	{
				
				var textoBruto = JSON.stringify(response.data.intervencion)
				jQuery("#intervencion p b")[0].innerText = decodeURIComponent(escape(textoBruto.split("\\n")[0])).substr(1)
				textoBruto = textoBruto.split("\\n")
				textoBruto.shift()
				textoBruto = "\"" + textoBruto.join("\\n")
				jQuery("#intervencion p")[1].innerText = decodeURIComponent(escape(JSON.parse(textoBruto).substr(0, textoBruto.length - 2)))
			}catch(e){
				console.log(e.message)
			}
		})
		.catch(function(error){
		})
	}

	$scope.getDoneCombs = function(){
		$webService.getDoneCombs()
		.then(function(response){
			try{
				var combBruto = []
				if(!Array.isArray(response.data)){
					if(response.data != "false") combBruto.push(response.data)
				}else{
					combBruto = response.data
				}

				combBruto.forEach(function(comb){ 
					comb.title = JSON.parse(JSON.stringify(comb.respuesta).split("\\n")[0]+"\"")
					comb.title = comb.title.substr(0,comb.title.length-1)
				})
				$scope.combinations = combBruto
			}catch(e){
			}
		})
		.catch(function(error){

		});
	}
	$scope.getDoneCombs()
});