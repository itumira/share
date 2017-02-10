<%-- 
    Document   : newjsp
    Created on : 31 janv. 2017, 08:38:31
    Author     : Ethan Mirado
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="assets/js/angular.min.js"></script>
    </head>

    <body ng-app="myApp" ng-controller="myCtrl">

        <h1 ng-repeat="x in records">{{x}}</h1>

        <script>
                    var app = angular.module("myApp", []);
                    app.controller("myCtrl", function ($scope) {
                        $scope.records = [
                            "Alfreds Futterkiste",
                            "Berglunds snabbköp",
                            "Centro comercial Moctezuma",
                            "Ernst Handel",
                        ]
                    });
        </script>

    </body>

</html>
