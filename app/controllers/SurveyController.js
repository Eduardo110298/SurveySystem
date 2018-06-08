app.controller("SurveyController", function($scope, $webService, $window, $compile) {
	$scope.traerEncuestas = function(){
		$webService.getSurveys()
		.then(function(response){
			console.log(response.data)
		})
		.catch(function(error){

		});
	}
	$scope.traerEncuestas();
	// $scope.action = function($event){
	// 	alert("hola")
	// }
});