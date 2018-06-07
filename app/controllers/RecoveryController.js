app.controller("RecoveryController", function($scope, $webService, $window) {
	$scope.data = {
		user:'',
		question:'',
		answer:'',
		pass:''
	}
	$scope.submitUser = function(){
		$webService.validateUser($scope.data)
		.then(function(response){
			if(response.data.found){
				jQuery("#question-form").slideToggle();
				jQuery("#user-form").slideToggle();
				console.log(response.data)
				$scope.data.question = response.data.user.pregunta;
			}else{
				alert("Usuario no valido")
			}
		})
		.catch(function(error){

		});
	}

	$scope.submitAnswer = function(){
		$webService.validateAnswer($scope.data)
		.then(function(response){
			if(response.data.found){
				alert("Correcto!")
				jQuery("#password-form").slideToggle();
				jQuery("#question-form").slideToggle();
			}else{
				console.log(response)
				alert("Respuesta Incorrecta")
			}
		})
		.catch(function(error){

		});	
	}
	$scope.submitPassword = function(){
		$webService.setPassword($scope.data)
		.then(function(response){
			if(response.data.success){
				alert("Cambio Exitoso")
				$window.location.href = "login.php"
			}
		})
		.catch(function(error){

		});	
	}
});