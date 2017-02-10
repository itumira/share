<%@page import="entite.DetPublication"%>
<%@ include file="template/top.jsp" %>
<%
    String uid = request.getParameter("uid");
    int id = Integer.parseInt(uid);
    Utilisateur profile = new Utilisateur();
    profile.setIduser(id);
    profile.getByIdUtilisateur();
%>
<%
    if (id == u.getIduser()) {
%>
<script>
    $("#profile").addClass("active");
    $("#abonnes").removeClass("active");
    $("#activite").removeClass("active");
</script>
<%
} else {
%>
<script>
    $("#profile").removeClass("active");
    $("#abonnes").addClass("active");
    $("#activite").removeClass("active");


</script>   
<%
    }
%>

<div class="col-md-12">
    <div class="row">
        <div class="col-md-12">
            <div class="profile-info-right">
                <ul class="col-md-9 nav nav-pills nav-pills-custom-minimal custom-minimal-bottom">
                    <li class="active"><a href="#activities" data-toggle="tab">ACTIVITES</a></li>
                    <li><a href="#followers" data-toggle="tab">A PROPOS</a></li>
                        <%
                            if (u.getIduser() == profile.getIduser()) {
                        %>
                    <li><a href="#following" data-toggle="tab">PARAMETRES</a></li>
                        <%
                            }
                        %>

                </ul>
                <div class="action-buttons col-md-3">
                    <button id="neplussuivre<% out.print(profile.getIduser()); %>" type="button" class="btn btn-sm btn-toggle-following pull-right"><i class="fa fa-checkmark-round"></i> <span>Suivi</span></button>
                    <button id="traitement<% out.print(profile.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-clock-o"></i> En attente</button>
                    <button id="suivre<% out.print(profile.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-plus"></i> Suivre</button>
                    <button id="annulerdemande<% out.print(profile.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-remove"></i> Annuler demande</button>
                    <input type="hidden" id="moi<% out.print(profile.getIduser()); %>" value="<%out.print(u.getIduser());%>">
                    <input type="hidden" id="lui<% out.print(profile.getIduser()); %>" value="<% out.print(profile.getIduser());%>">
                    <script>
                        $('#traitement<% out.print(profile.getIduser()); %>').hide();
                        <%
                            if (u.getIduser() == profile.getIduser()) {
                        %>
                        $('#neplussuivre<% out.print(profile.getIduser()); %>').hide();
                        $('#annulerdemande<% out.print(profile.getIduser()); %>').hide();
                        $('#suivre<% out.print(profile.getIduser()); %>').hide();
                        <%
                        } else if (u.getIduser() != profile.getIduser()) {
                            if (u.isFollowedToo(profile.getIduser())) {
                        %>
                        $('#neplussuivre<% out.print(profile.getIduser()); %>').show();
                        $('#annulerdemande<% out.print(profile.getIduser()); %>').hide();
                        $('#suivre<% out.print(profile.getIduser()); %>').hide();
                        <%
                        } else if (!u.isFollowedToo(profile.getIduser())) {
                            if (!u.askNotConfirmed(profile.getIduser())) {
                        %>
                        $('#neplussuivre<% out.print(profile.getIduser()); %>').hide();
                        $('#annulerdemande<% out.print(profile.getIduser()); %>').hide();
                        $('#suivre<% out.print(profile.getIduser()); %>').show();
                        <%
                        } else {
                        %>
                        $('#neplussuivre<% out.print(profile.getIduser()); %>').hide();
                        $('#annulerdemande<% out.print(profile.getIduser()); %>').show();
                        $('#suivre<% out.print(profile.getIduser()); %>').hide();
                        <%
                                    }
                                }
                            }
                        %>
                        $("#suivre<% out.print(profile.getIduser()); %>").click(function () {
                            $('#traitement<% out.print(profile.getIduser()); %>').show();
                            $('#suivre<% out.print(profile.getIduser());%>').hide();
                            $.ajax({
                                url: 'traite/demandeabonnement.jsp',
                                type: 'POST',
                                dataType: 'html',
                                data: 'idmoi=' + document.getElementById('moi<% out.print(profile.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(profile.getIduser()); %>').value,
                                success: function (code_html, statut) {
                                    //  alert(code_html);
                                    $('#annulerdemande<% out.print(profile.getIduser()); %>').show();
                                },
                                error: function (resultat, statut, erreur) {
                                    alert("erreur");
                                },
                                complete: function (resultat, statut) {
                                    $('#traitement<% out.print(profile.getIduser()); %>').hide();
                                }
                            });
                        });
                        $("#annulerdemande<% out.print(profile.getIduser()); %>").click(function () {
                            $('#traitement<% out.print(profile.getIduser()); %>').show();
                            $('#annulerdemande<% out.print(profile.getIduser());%>').hide();
                            $.ajax({
                                url: 'traite/annulerdemandeabonnement.jsp',
                                type: 'POST',
                                dataType: 'html',
                                data: 'idmoi=' + document.getElementById('moi<% out.print(profile.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(profile.getIduser()); %>').value,
                                success: function (code_html, statut) {
                                    //  alert(code_html);
                                    $('#suivre<% out.print(profile.getIduser()); %>').show();
                                },
                                error: function (resultat, statut, erreur) {
                                    alert("erreur");
                                },
                                complete: function (resultat, statut) {
                                    $('#traitement<% out.print(profile.getIduser()); %>').hide();
                                }
                            });
                        });
                        $("#neplussuivre<% out.print(profile.getIduser()); %>").click(function () {
                            $('#traitement<% out.print(profile.getIduser()); %>').show();
                            $('#neplussuivre<% out.print(profile.getIduser());%>').hide();
                            $.ajax({
                                url: 'traite/neplussuivre.jsp',
                                type: 'POST',
                                dataType: 'html',
                                data: 'idmoi=' + document.getElementById('moi<% out.print(profile.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(profile.getIduser()); %>').value,
                                success: function (code_html, statut) {
                                    //  alert(code_html);
                                    $('#suivre<% out.print(profile.getIduser()); %>').show();
                                },
                                error: function (resultat, statut, erreur) {
                                    alert("erreur");
                                },
                                complete: function (resultat, statut) {
                                    $('#traitement<% out.print(profile.getIduser()); %>').hide();
                                }
                            });
                        });
                    </script>
                </div>
                <div class="tab-content">
                    <!-- activities -->
                    <div class="tab-pane fade in active" id="activities" ng-controller="listdata">
                        </br></br>
                        <%
                            if ((u.getIduser() == profile.getIduser()) || (u.getIduser() != profile.getIduser() && u.isFollowedToo(profile.getIduser()))) {
                        %>
                        <div id="lala">
                            </br></br></br></br></br></br></br></br>    
                            <p class="text-center"><img src="img/loading.gif" alt="chargement" /></p>
                            <p class="text-center">Chargement des donn&eacute;es...</p>
                        </div>
                        <div class="media activity-item" ng-repeat="a in publications">
                            <a href="#" class="pull-left">
                                <img src="guy-2.jpg" alt="img" class="media-object avatar">
                            </a>
                            <div class="media-body">
                                <p class="activity-title"><a href="#">{{a.nomprenom}}</a> a publi&eacute; <small class="text-muted">- {{tempsreel(a.datepublication, a.heurepublication)}}</small></p>
                                <small class="text-muted">{{a.heurepublication}} - {{a.datepublication}}</small>
                                <p>{{a.contenupublication}}</p>

                                <div class="stats">
                                    <a href="#" class="stat-item">
                                        <i class="fa fa-binoculars icon"></i> {{a.confidentialite}}
                                    </a>
                                    <a href="#" class="stat-item">
                                        <i class="fa fa-share icon"></i> {{a.nbrpa}}
                                    </a>
                                </div>
                            </div>
                            <input type="hidden" id="public" value="{{a.idpublication}}"/>
                            <div class="btn-group pull-right activity-actions">
                                <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown">
                                    <i class="fa fa-th"></i>
                                    <span class="sr-only">plus</span>
                                </button>
                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                    <%
                                        if (u.getIduser() != profile.getIduser()) {
                                    %>
                                    <li><a href="#" class="stat-item">Signaler</a></li>
                                        <%
                                        } else {
                                        %>
                                    <li><a id="delete" href="javascript:void(0);" ng-click="deletethis(a.idpublication);">Supprimer</a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                                <script>
                                        var app = angular.module('angularTable', ['angularUtils.directives.dirPagination']);

                                        app.controller('listdata', function ($scope, $http) {
                                            $scope.publications = []; //declare an empty array
                                            $http.get("publicationUtilisateur?iduser=<% out.print(profile.getIduser());%>").success(function (response) {
                                                $('#lala').hide();
                                                $scope.publications = response;  //ajax request to fetch data into $scope.data
                                            });
                                            $scope.deletethis = function (idee) {
                                                $.ajax({
                                                    url: 'traite/supprimerpub.jsp',
                                                    type: 'POST',
                                                    dataType: 'html',
                                                    data: 'idpublication=' + idee,
                                                    success: function (code_html, statut) {
                                                        $http.get("publicationUtilisateur?iduser=<% out.print(profile.getIduser());%>").success(function (response) {
                                                            $scope.publications = response;  //ajax request to fetch data into $scope.data
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
                                        });
                                </script>
                            </div>
                        </div>
                        <%
                        } else if (u.getIduser() != profile.getIduser() && !u.isFollowedToo(profile.getIduser())) {
                        %>
                        <h4 class="text-center"> Suivez <% out.print(profile.getPrenomuser()); %> pour voir ses activit&eacute;s.</h4>
                        <%
                            }
                        %>
                    </div>
                    <!-- end activities -->
                    <!-- followers -->
                    <div class="tab-pane fade" id="followers">
                        </br></br>
                        <div class="user-info-right">
                            <div class="basic-info">
                                <h3><i class="fa fa-square"></i> Informations</h3>
                                <p class="data-row">
                                    <span class="data-name">Nom</span>
                                    <span class="data-value"><% out.print(profile.getNomuser());%></span>
                                </p>
                                <p class="data-row">
                                    <span class="data-name">Pr&eacute;nom(s)</span>
                                    <span class="data-value"><% out.print(profile.getPrenomuser());%></span>
                                </p>
                                <p class="data-row">
                                    <span class="data-name">Email</span>
                                    <%
                                        if ((u.getIduser() == profile.getIduser()) || (u.getIduser() == profile.getIduser() && u.isFollowedToo(profile.getIduser()))) {
                                    %>
                                    <span class="data-value"><% out.print(profile.getEmailuser());%></span>
                                    <%
                                    } else if (u.getIduser() != profile.getIduser() && !u.isFollowedToo(profile.getIduser())) {
                                    %>
                                    <span class="data-value">Suivez <% out.print(profile.getPrenomuser()); %> pour voir cette information.</span>
                                    <%
                                        }
                                    %>
                                </p>
                                <p class="data-row">
                                    <span class="data-name">Photo</span>
                                    <span class="data-value"><img src="<% out.print(profile.getImguser());%>" alt="img-profile"></span>
                                </p>
                            </div>
                            <div class="contact_info">
                                <h3><i class="fa fa-square"></i> Interactions</h3>
                                <p class="data-row">
                                    <span class="data-name">Nombre de publications</span>
                                    <span class="data-value"><% out.print(profile.getNombreDePublications()); %></span>
                                </p>
                                <p class="data-row">
                                    <span class="data-name">Abonn&eacute;s</span>
                                    <span class="data-value"><% out.print(profile.getNbAbonnes());%></span>
                                </p>
                                <p class="data-row">
                                    <span class="data-name">Abonnements</span>
                                    <span class="data-value"><% out.print(profile.getNbAbonnements());%></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- end followers -->
                    <!-- following -->
                    <div class="tab-pane fade" id="following">
                        <div class="profile-info col-md-12">
                            <!-- update info -->
                            <div class="widget post panel-shadow animated fadeInUp">
                                <div class="widget-header">
                                    <h3 class="widget-caption">Changer le mot de passe</h3>
                                </div>            
                                <div class="widget-body">
                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Mot de passe actuel</label>
                                        <div class="col-md-7">
                                            <input class="form-control" type="text" value="">
                                            <br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Nouveau mot de passe</label>
                                        <div class="col-md-7">
                                            <input class="form-control" type="text" value="">
                                            <br>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-5 control-label">Confirmez le mot de passe</label>
                                        <div class="col-md-7">
                                            <input class="form-control" type="text" value="">
                                            <br>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-danger">Enregistrer</button>
                                    </div>
                                    <br>
                                </div>
                            </div><!-- end update info-->
                            <!-- update info -->
                            <div class="widget post panel-shadow animated fadeInUp">
                                <form name="myform" action="traite/uploadimg.jsp" method="post" enctype="multipart/form-data">
                                    <div class="widget-header">
                                        <h3 class="widget-caption">Modifier ma photo</h3>
                                    </div>            
                                    <div class="widget-body">
                                        <div class="form-group">
                                            <label class="col-md-5 control-label">Importer</label>
                                            <div class="col-md-7">
                                                <input type="file" id="image" class="form-control" name="image">
                                                <br>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-danger">Enregistrer</button>
                                        </div>
                                        <br>
                                    </div>
                                </form>
                            </div><!-- end update info-->
                        </div>
                    </div>
                    <!-- end following -->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/dirPagination.js"></script>
<%@ include file="template/bottom.jsp" %>