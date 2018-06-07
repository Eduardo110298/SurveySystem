app.controller("MenuController", function($scope, $webService) {
	$scope.obtener = function($event){
		var anchor = $event.currentTarget
		
		jQuery(".menu li.active").removeClass("active")
		jQuery(anchor.parentNode).addClass("active")
		
		$webService.getHTML(anchor.id)
		.then(function(response){
			document.getElementById("content").innerHTML = response.data
		})
		.catch(function(error){

		})
	}
});