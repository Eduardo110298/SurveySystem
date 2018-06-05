app.controller("LoginController", function($scope, $webService) {
   jQuery("#mybutton").click(function(){
   		var mivar = $webService.login("eduardo","contrasegura").then(function(data){
   			console.log(data);
   		});

   }); 
});