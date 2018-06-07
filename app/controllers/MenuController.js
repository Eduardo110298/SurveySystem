app.controller("MenuController", function($scope, $webService, $compile, $rootScope) {
	$scope.obtener = function($event){
		var anchor = $event.currentTarget
		
		jQuery(".menu li.active").removeClass("active")
		jQuery(anchor.parentNode).addClass("active")
		
		$webService.getHTML(anchor.id)
		.then(function(response){
			document.getElementById("content").innerHTML = response.data
			$compile(document.getElementById("content"))($scope);
			$compile(document.getElementById("content"))($rootScope);
		})
		.catch(function(error){

		})
	}
});