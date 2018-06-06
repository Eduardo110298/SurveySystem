app.controller("SessionController", function($scope, $webService, $window) {
	$scope.user = {
		user:'',
		pass:''
	}

	$scope.newUser = {
		firstName:'',
		lastName:'',
		user:'',
		pass:'',
		pass2:'',
		question:'',
		answer:''
	}

	$scope.submitRegistryData = function(){
		$webService.register($scope.newUser)
		.then(function(response){
			console.log(response)
		})
		.catch(function(error){

		});
	}

	$scope.submitLoginData = function(){
		$webService.login($scope.user)
   		.then(function(response){
   			console.log(response)
   			if(response.data.found){
   				$window.location.href = "index.php"
   			}else{
   				alert("Datos incorrectos. Debe registrarse para poder ingresar al sistema.");
   			}
   		})
   		.catch(function(error){

   		});
	}

	$scope.logout = function(){
		$webService.logout();
	}

	$scope.toggleForms = function($event){
		if($event.currentTarget.parentNode.id=="login-form"){
			jQuery(".login").css("width","initial")
		}else{
			jQuery(".login").css("width","400px")
		}
		jQuery("#login-form").slideToggle();
		jQuery("#register-form").slideToggle();
	}
});