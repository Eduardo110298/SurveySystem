app.controller("SessionController", function($scope, $webService, $window) {
	$scope.user = {
		user:'',
		pass:''
	}

	$scope.submit = function(){
		$webService.login($scope.user)
   		.then(function(response){
   			console.log(response);
   			// if(response.data.found){
   			// 	$window.location.href = "index.php"
   			// }else{
   			// 	alert("Datos incorrectos. Debe registrarse para poder ingresar al sistema.");
   			// }
   		})
   		.catch(function(error){

   		});
	}

	$scope.logout = function(){
		$webService.logout();
	}
});