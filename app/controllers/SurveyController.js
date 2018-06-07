app.controller("SurveyController", function($scope, $webService, $window) {
	$scope.action = function($event){
		console.log($event.currentTarget)
	}
});