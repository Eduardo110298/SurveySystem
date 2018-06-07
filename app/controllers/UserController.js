app.controller("UserController", function($scope, $webService, $window, $compile, $rootScope) {
	
	$scope.updatedUser = $rootScope.userData
	
	$scope.updateUser = function(){
		$webService.updateUser($scope.updateUser)
		.then(function(response){
			if(response.data.found){
				$scope.data.question = response.data.user[4]
			}else{
				alert("Usuario no valido")
			}
		})
		.catch(function(error){

		});
	}

});