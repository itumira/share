<%@page import="java.util.List"%>
<%@page import="entite.DetPublication"%>
<%@page import="entite.DetPublication"%>
<%@ include file="template/top.jsp" %>
<script>
    $("#abonnes").removeClass("active");
    $("#profile").removeClass("active");
    $("#activite").addClass("active");</script>


<div  ng-controller="listpubfortimeline">
    <div class="panel">
        <form>
            <textarea id="publication" placeholder="Qu'est-ce qui se passe autour de vous aujourd'hui?" rows="2" class="form-control input-lg p-text-area"></textarea>
        </form>
        <div class="panel-footer">
            <button ng-click="newPublication()" class="btn btn-danger pull-right">Poster</button>
            <script>
                        var longi = 0;
                        var lati = 0;
                                function maPosition(position) {
                                    longi = position.coords.longitude;
                                    lati = position.coords.latitude;
                                }

                        if (navigator.geolocation) {
                            navigator.geolocation.getCurrentPosition(maPosition);
                        } else {
                            longi = 0;
                            lati = 0;
                        }
                        console.log(longi);
                        console.log(lati);
            </script>
            <ul class="nav nav-pills">
                <!-- <li>
                    <a href="#"><i class="fa fa-map-marker"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-camera"></i></a>
                </li>
                <li>
                    <a href="#"><i class=" fa fa-film"></i></a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-microphone"></i></a>
                </li>-->
            </ul>
        </div>
    </div>
    <div class="profile-info animated fadeInUp" id="publicationsauj">
        <div id="lala">
            </br></br></br></br></br></br></br></br>    
            <p class="text-center"><img src="img/loading.gif" alt="chargement" /></p>
            <p class="text-center">Chargement des donn&eacute;es...</p>
        </div>
        <div class="panel panel-white post" dir-paginate="a in publications | orderBy:'-idpartage' |  itemsPerPage:7">
            <div class="post-heading">
                <div class="pull-left image">
                    <img src="img/{{a.imgpartageur}}" class="avatar" alt="user profile image">
                </div>
                <div class="pull-left meta">
                    <div ng-show="montrerpublier(a.nomprenompartageur)" class="title h5">
                        <a href="profile.jsp?uid={{a.iduser}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">{{a.nomprenom}}</a>
                        a publi&eacute;.
                    </div>
                    <div ng-show="montrerpartager(a.nomprenompartageur)" class="title h5">
                        <p ng-show="montrerpartagesaproprepublication(a.idpartageur, a.iduser)">
                            <a href="profile.jsp?uid={{a.idpartageur}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">{{a.nomprenompartageur}}</a>
                            a partag&eacute; sa propre publication.
                        </p>
                        <p ng-hide="montrerpartagesaproprepublication(a.idpartageur, a.iduser)">
                            <a href="profile.jsp?uid={{a.idpartageur}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">{{a.nomprenompartageur}}</a>
                            a partag&eacute; la publication de 
                            <a href="profile.jsp?uid={{a.iduser}}&midh=<% out.print(u.getIduser()); %>&idshare={{a.idpartageur}}" class="post-user-name">{{a.nomprenom}}.</a>
                        </p>
                    </div>
                    <h6 class="text-muted time">{{tempsreel(a.datepartage, a.heurepartage)}}</h6>
                </div>
            </div> 
            <div class="post-description">
                <p>{{a.contenupublication}}</p>
                <div class="stats">
                    <a href="javascript:void(0);" class="stat-item">
                        <i class="fa fa-binoculars icon"></i> {{a.confidentialite}}
                    </a>
                    <a class="stat-item" href="javascript:void(0);" ng-click="partagerPublication(a.nomprenom, a.contenupublication, a.confidentialite, a.nbrpa, a.idpublication, a.iduser)">
                        <i class="fa fa-share icon"></i> {{a.nbrpa}} Partager
                    </a>
                    <!--<a href="#" class="stat-item">
                        <i class="fa fa-map-marker icon"></i> Andoharanofotsy
                    </a>-->
                    <a ng-show="showsignaler(a.iduser)" href="javascript:void(0)" ng-click="signalerPublication(a.nomprenom, a.contenupublication, a.confidentialite, a.nbrpa, a.idpublication, a.iduser)" class="stat-item">
                        <i class="fa fa-warning icon"></i> Signaler
                    </a>
                    <a ng-show="showdelete(a.iduser)" ng-click="deletethis(a.idpublication)" href="javascript:void(0)" class="stat-item">
                        <i class="fa fa-close icon"></i> Supprimer
                    </a>
                </div>
            </div>
        </div>

        <div class="text-center">
            <div class="col-xs-12">
                <dir-pagination-controls max-size="5" direction-links="true" boundary-links="true" >
                </dir-pagination-controls>
            </div>
        </div>
        <!--<div class="panel panel-white post-load-more panel-shadow text-center">
            <button class="btn btn-danger">
                <i class="fa fa-refresh"></i> plus...
            </button>
        </div>-->		
    </div>

    <script src="assets/js/login-register.js"></script>
    <div class="modal-dialog modal fade animated" id="shareModal">
        <div class="col-md-12 modal-content">
            <div class="modal-header" style="border-bottom:0px !important">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="text-info text-center">Partager cette publication?</h4>
                <input type="hidden" id="idpublieurshare" value="">
                <input type="hidden" id="idpublicationshare" value="">
            </div>
            <div class="modal-body"style="border-bottom:1px !important;border-top: 1px !important;padding-top: 0px !important">  
                <div class="content ">
                    <div class="error"></div>
                    <div class="form col-md-12 loginBox">
                        <div class="media activity-item">
                            <a href="#" class="pull-left">
                                <img src="guy-2.jpg" alt="img" class="media-object avatar">
                            </a>
                            <div class="media-body">
                                <p class="activity-title"><a href="#" id="usernamepartage"></a> a publi&eacute;</p>
                                <p id="contenupublicationpartage"></p>
                                <div class="stats">
                                    <a class="stat-item">
                                        <i class="fa fa-binoculars icon"></i> <span id="confidentialitepartage"></span>
                                    </a>
                                    <a class="stat-item">
                                        <i class="fa fa-share icon"></i> <span id="nbrpapartage"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="border-top:0px !important">
                <div class="col-md-4 col-md-offset-4 register-footer">
                    <button type="button" class="col-md-12 btn btn-danger" data-dismiss="modal" aria-hidden="true">Annuler</button>
                </div>
                <div class="col-md-4 login-footer">
                    <a href="javascript:void(0)" ng-click="partager()"><button type="button" class="col-md-12 btn btn-success"  data-dismiss="modal" aria-hidden="true">Partager</button></a>
                </div>
            </div>        
        </div>
    </div>

    <div class="modal-dialog modal fade animated" id="signalerModal">
        <div class="col-md-12 modal-content">
            <div class="modal-header" style="border-bottom:0px !important">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="text-info text-center">Signaler cette publication?</h4>
                <input type="hidden" id="idpublieursignal" value="">
                <input type="hidden" id="idpublicationsignal" value="">
            </div>
            <div class="modal-body" style="border-bottom:1px !important;border-top: 1px !important;padding-top: 0px !important">  
                <div class="content ">
                    <div class="error"></div>
                    <div class="form col-md-12 loginBox">
                        <div class="media activity-item">
                            <a href="#" class="pull-left">
                                <img src="guy-2.jpg" alt="img" class="media-object avatar">
                            </a>
                            <div class="media-body">
                                <p class="activity-title"><a href="#" id="usernamesignal"></a> : <span id="contenupublicationsignal"></span></p>

                                <div class="stats">
                                    <a class="stat-item">
                                        <i class="fa fa-binoculars icon"></i> <span id="confidentialitesignal"></span>
                                    </a>
                                    <a class="stat-item">
                                        <i class="fa fa-share icon"></i> <span id="nbrpasignal"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer" style="border-top:0px !important">
                <div class="col-md-4 col-md-offset-4 register-footer">
                    <button type="button" class="col-md-12 btn btn-danger" data-dismiss="modal" aria-hidden="true">Annuler</button>
                </div>
                <div class="col-md-4 login-footer">
                    <button type="button" class="col-md-12 btn btn-success" data-dismiss="modal" aria-hidden="true">Signaler</button>    
                </div>
            </div>        
        </div>
    </div>
</div>

<script>
    var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);
    app.controller('notifCtrl', function ($scope, $interval, $http) {
        $scope.activities = [];
        $http.get("Activites?iduser=<% out.print(u.getIduser());%>").success(function (response) {
            $scope.activities = response;
        });
        var timer = $interval(function () {
            $http.get("Activites?iduser=<% out.print(u.getIduser());%>").success(function (response) {
                $scope.activities = response;
            });
        }, 60000);
        $scope.montrerpartagesaproprepublicationA = function (idpartageur, iduser) {
            if (iduser === idpartageur)
                return true;
            else
                return false;
        };
        $scope.montrerpublierA = function (nomprenom) {
            if (nomprenom === "null null")
                return true;
            else if (nomprenom !== "null null")
                return false;
        };
        $scope.montrerpartagerA = function (nomprenom) {
            if (nomprenom === "null null")
                return false;
            else if (nomprenom !== "null null")
                return true;
        };
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
    app.controller('listpubfortimeline', function ($scope, $http) {
        $scope.publications = []; //declare an empty array
        $http.get("publicationsForTimeline?iduser=<% out.print(u.getIduser());%>").success(function (response) {
            $('#lala').hide();
            $scope.publications = response; //ajax request to fetch data into $scope.data
        });
        $scope.montrerpublier = function (nomprenom) {
            if (nomprenom === "null null")
                return true;
            else if (nomprenom !== "null null")
                return false;
        };
        $scope.montrerpartager = function (nomprenom) {
            if (nomprenom === "null null")
                return false;
            else if (nomprenom !== "null null")
                return true;
        };
        $scope.deletethis = function (idee) {
            $.ajax({
                url: 'traite/supprimerpub.jsp',
                type: 'POST',
                dataType: 'html',
                data: 'idpublication=' + idee,
                success: function (code_html, statut) {
                    $http.get("publicationsForTimeline?iduser=<% out.print(u.getIduser());%>").success(function (response) {
                        $scope.publications = response; //ajax request to fetch data into $scope.data
                    });
                },
                error: function (resultat, statut, erreur) {
                    alert("erreur");
                },
                complete: function (resultat, statut) {
                }
            });
        };
        $scope.myVar = true;
        $scope.showsignaler = function (idee) {
            if (<%out.println(u.getIduser());%> != idee)
                return true;
            else
                return false;
        };
        $scope.showdelete = function (idee) {
            if (<%out.println(u.getIduser());%> == idee)
                return true;
            else
                return false;
        };
        $scope.newPublication = function () {
            $.ajax({
                url: 'traite/publier.jsp',
                type: 'POST',
                dataType: 'html',
                data: 'shid=<% out.print(u.getIduser()); %>&confid=1&publication=' + document.getElementById('publication').value
                        + '&longitude=' + longi + '&latitude=' + lati,
                success: function (code_html, statut) {
                    $http.get("publicationsForTimeline?iduser=<% out.print(u.getIduser());%>").success(function (response) {
                        $scope.publications = response; //ajax request to fetch data into $scope.data
                    });
                },
                error: function (resultat, statut, erreur) {
                    alert("erreur");
                },
                complete: function (resultat, statut) {
                }
            });
        };
        $scope.partagerPublication = function (usernamepartage, contenupublicationpartage, confidentialitepartage, nbrpapartage, idpublication, idpublieur) {
            openPartagerModal();
            document.getElementById("usernamepartage").innerHTML = usernamepartage;
            document.getElementById("contenupublicationpartage").innerHTML = contenupublicationpartage;
            document.getElementById("confidentialitepartage").innerHTML = confidentialitepartage;
            document.getElementById("nbrpapartage").innerHTML = nbrpapartage;
            document.getElementById("idpublieurshare").value = idpublieur;
            document.getElementById("idpublicationshare").value = idpublication;
        };
        $scope.signalerPublication = function (usernamesignal, contenupublicationsignal, confidentialitesignal, nbrpasignal, idpublication, idpublieur) {
            openSignalerModal();
            document.getElementById("usernamesignal").innerHTML = usernamesignal;
            document.getElementById("contenupublicationsignal").innerHTML = contenupublicationsignal;
            document.getElementById("confidentialitesignal").innerHTML = confidentialitesignal;
            document.getElementById("nbrpasignal").innerHTML = nbrpasignal;
            document.getElementById("idpublieursignal").value = idpublieur;
            document.getElementById("idpublicationsignal").value = idpublication;
        };
        $scope.signaler = function () {

        };
        $scope.partager = function () {
            $.ajax({
                url: 'traite/partager.jsp',
                type: 'GET',
                dataType: 'html',
                data: 'pubtsid=' + document.getElementById('idpublicationshare').value + '&longitude=' + longi + '&latitude=' + lati + '&shid=' + <% out.println(u.getIduser()); %>,
                success: function (code_html, statut) {
                    $http.get("publicationsForTimeline?iduser=<% out.print(u.getIduser());%>").success(function (response) {
                        $scope.publications = response; //ajax request to fetch data into $scope.data
                    });
                },
                error: function (resultat, statut, erreur) {
                    alert("erreur");
                },
                complete: function (resultat, statut) {
                }
            });
        };

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
        $scope.montrerpartagesaproprepublication = function (idpartageur, iduser) {
            if (iduser === idpartageur)
                return true;
            else
                return false;
        };
    });
</script>


<%@ include file="template/bottom.jsp" %>