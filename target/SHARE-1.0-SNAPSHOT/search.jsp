<%@ include file="template/top.jsp" %>
<script>
    $("#abonnes").removeClass("active");
    $("#profile").removeClass("active");
    $("#activite").removeClass("active");
</script>

<%
    String q = request.getParameter("q");
%>
<!-- Timeline content -->
<div class="animated fadeIn container container-timeline list-users" ng-controller="searchCtrl">
    <div class="col-md-10 no-paddin-xs">
        <div class="row col-md-8 text-center color-container">
            <h3 class="profile-name">R&eacute;sultats de la recherche</h3>
        </div>

        <div class="col-md-8 animated fadeInUp">
            <div class="widget">
                <div class="table-responsive">
                    <table class="table user-list">
                        <tbody>
                            <tr dir-paginate="result in searchresult | itemsPerPage:7">
                                <td>
                                    <img src="img/Friends/guy-2.jpg" alt="img">
                                    <a href="profile.jsp?uid={{result.iduser}}" class="user-link">{{result.nomprenomuser}}</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="text-center">
                    <div class="col-xs-12">
                        <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true" >
                        </dir-pagination-controls>
                    </div>
                </div>
            </div>
        </div><!-- end timeline content-->
    </div>
</div>
<script>
    var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);

    app.controller('searchCtrl', function ($scope, $http) {
        $scope.searchresult = []; //declare an empty array
        $http.get("searchresult?q=<% out.print(q);%>").success(function (response) {
            $('#lala').hide();
            $scope.searchresult = response;  //ajax request to fetch data into $scope.data
        });
    });
</script>
<%@ include file="template/bottom.jsp" %>