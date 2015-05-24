app.controllers.controller('QuestionsController', ['$scope', '$location', '$resource', '$http', 'QuestionService', function($scope, $location, $resource, $http, TripsService) {

    $scope.questions = QuestionService.getQuestions();
}]);
