app.controller("LoginController", function($scope, $webService) {
   jQuery("#mybutton").click(function(){
   		$webService.login("eduardo","contrasegura")
   		.then(function(response){
   			console.log(response);
   		})
   		.catch(function(error){

   		});

   }); 
});