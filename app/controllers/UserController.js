app.controller("UserController", function($scope, $webService, $window) {
	$scope.updateUser = {
		firstName:'',
		lastName:'',
		question:'',
		answer:'',
		pass:''
	}
	var mivar = <?php echo json_encode($_SESSION["user"]); ?>
	console.log(mivar)
	$scope.loadUser = function(){
		$webService.saveUser($scope.data)
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