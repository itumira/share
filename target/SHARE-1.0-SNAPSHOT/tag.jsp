<%@page import="entite.DetPublication"%>
<%@ include file="template/top.jsp" %>
<%
    /* String uid = request.getParameter("uid");
    int id = Integer.parseInt(uid);
    Utilisateur profile = new Utilisateur();
    profile.setIduser(id);
    profile.getByIdUtilisateur();*/
    DBConnect dbccc = new DBConnect();
    Connection conne = dbccc.getconn();
    String tagid = request.getParameter("tid");
    int tid = Integer.parseInt(tagid);
    Tag tagg = new Tag();
    tagg.setIdtag(tid);
    tagg.getTag(conne);
    /*List<DetPublication> listeta = t.getAllPublications();*/
    conne.close();
%>
<script>
    $("#profile").removeClass("active");
    $("#abonnes").removeClass("active");
    $("#activite").removeClass("active");
</script>

<div class="col-md-12">
    <div class="row">
        <div class="col-md-12">
            <div class="profile-info-right" ng-controller="listdata">
                <div>
                    <h3 class="col-xs-6">Publications contenant : <% out.print(tagg.getThetag()); %></h3>
                    <div class="col-xs-6 pull-right">
                        <div class="col-xs-12">
                            <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true" >
                            </dir-pagination-controls>
                        </div>
                    </div>
                </div>
                </br></br>
                </br></br>
                <div id="lala">
                    </br></br></br></br></br></br></br></br>    
                    <p class="text-center"><img src="img/loading.gif" alt="chargement" /></p>
                    <p class="text-center">Chargement des donn&eacute;es...</p>
                </div>
                <div class="media activity-item" dir-paginate="x in names | filter : test | itemsPerPage:5">
                    <a href="#" class="pull-left">
                        <img src="guy-2.jpg" alt="img" class="media-object avatar">
                    </a>
                    <div class="media-body">
                        <p class="activity-title"><a href="profile.jsp?uid={{x.iduser}}">{{x.nomprenom}}</a> a publi&eacute; <small class="text-muted"> - {{tempsreel(x.date, x.heure)}} </small></p>
                        <small class="text-muted">
                            {{x.date}} - {{x.heure}}
                        </small> 
                        <p>
                            {{x.contenupublication}}
                        </p>

                        <div class="stats">
                            <a href="#" class="stat-item">
                                <i class="fa fa-binoculars icon"></i>{{x.confidentialite}}
                            </a>
                            <a href="#" class="stat-item">
                                <i class="fa fa-share icon"></i>{{x.nbrpa}}
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);

    app.controller('listdata', function ($scope, $http) {

        $scope.names = []; //declare an empty array
        $http.get("traite/getpubtag.jsp?idtag=<% out.print(tagid);%>").success(function (response) {
            $('#lala').hide();
            $scope.names = response;  //ajax request to fetch data into $scope.data
        });
        $scope.tempsreel = function (date, heure) {
            var an = Number(date.split("-")[2]);
            var mois = Number(date.split("-")[1]);
            var jour = Number(date.split("-")[0]);
            var h = Number(heure.split(":")[0]);
            var min = Number(heure.split(":")[1]);
            var sec = Number(heure.split(":")[2]);
            var dateheure = new Date(an, mois - 1, jour, h, min, sec, 0);
            return moment(dateheure.getTime()).fromNow();
        };
    });
</script>

<%@ include file="template/bottom.jsp" %>

