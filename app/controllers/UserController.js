app.controller("UserController", function($scope, $webService, $window, $compile, $rootScope) {
	
	$scope.updatedUser = $rootScope.userData
	
	$scope.updateUser = function(){
		$webService.updateUser($scope.updatedUser)
		.then(function(response){
			if(response.data.success){
				alert("Datos Guardados")
				$window.location.href='/SurveySystem/'
			}else{
				alert("Errir Fatal")
				console.log(response)
			}
		})
		.catch(function(error){

		});
	}

});