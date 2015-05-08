app.services.factory('QuestionService', ['$http', 'localStorageService', function($http, localStorageService) {
  var questionsAPI = {},
      indexURL = app.apiServerUrl + "/questions";

  var headers = {
    'email' : localStorageService.get("currentUserEmail"),
    'token': localStorageService.get("currentUserToken")
  };

  questionsAPI.getTrips = function() {
    return trips;
  };

  return questionsAPI;
}]);
