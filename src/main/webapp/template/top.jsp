<%@page import="entite.Utilisateur"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("id_user") != null) {

        Utilisateur u = new Utilisateur();
        u.setEmailuser((String) session.getAttribute("id_user"));
        u.getUtilisateur();
%>
<!DOCTYPE html>
<html lang="en"  ng-app="angularTable">
    <head>
        <title>BookPost</title>
        <%@ include file="../inc/inc-head.jsp" %>
        <script src="assets/js/angular.min.js"></script>
        <script src="assets/js/dirPagination.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/time.js"></script>
    </head>

    <body class="animated fadeIn">
        <!-- Fixed navbar -->
        <nav class="navbar navbar-default navbar-fixed-top navbar-principal">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">
                        <b>ShareIT</b>
                    </a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <div class="col-md-5 col-sm-4">         
                        <form class="navbar-form">
                            <div class="form-group" style="display:inline;">
                                <div class="input-group" style="display:table;">
                                    <input class="form-control" id="searchbar" name="search" placeholder="Rechercher..." autocomplete="off" type="text">
                                    <span class="input-group-addon" style="width:1%;">
                                        <a href="#" id="btnsearch"><span class="glyphicon glyphicon-search"></span></a>
                                    </span>
                                </div>
                            </div>
                            <script>
                                $("#btnsearch").click(function () {
                                    location.replace("search.jsp?q=" + document.getElementById("searchbar").value);
                                    $.ajax({
                                        url: 'searchresult',
                                        type: 'GET',
                                        dataType: 'html',
                                        data: 'q=' + document.getElementById("searchbar").value,
                                        success: function (code_html, statut) {

                                        },
                                        error: function (resultat, statut, erreur) {
                                            alert("erreur");
                                        },
                                        complete: function (resultat, statut) {

                                        }
                                    });
                                });
                            </script>
                        </form>
                    </div>        
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="profile.jsp?uid=<% out.print(u.getIduser()); %>">
                                <%
                                    out.print(u.getNomPrenom());
                                %>    
                                <img src="img/<%out.print(u.getImguser());%>" class="img-nav">
                            </a>
                        </li>
                        <!--<li class="active"><a href="home.html"><i class="fa fa-bars"></i>&nbsp;Home</a></li>-->
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <!--<i class="icon-bell-l" style="background: url('img/line-icon.png') no-repeat -217px -18px;"></i>-->
                                <i class="fa fa-bell-o"></i>
                                <span class="badge bg-important">7</span>
                            </a>
                            <ul class="dropdown-menu extended notification">
                                <div class="notify-arrow notify-arrow-blue"></div>
                                <li>
                                    <p class="blue">Notifications</p>
                                </li>
                                <li>
                                    <a href="#">
                                        <span class="label label-warning"><i class="icon_error-triangle"></i></span> 
                                        Rupture de stock : Biscuits
                                        <span class="small italic pull-right">5 mins</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">Voir les autres notifications</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#" class="nav-controller"><i class="fa fa-hashtag" aria-hidden="true"></i><b>#</b></a></li>        
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="profile.jsp?uid=<%out.print(u.getIduser());%>">Modifier profil</a></li>
                                <li><a href="traite/logout.jsp">Se d&eacute;connecter</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Timeline content -->
        <div class="container" style="margin-top:50px;">
            <div class="col-md-10 no-paddin-xs">
                <div class="row">
                    <!-- left content-->
                    <div class="profile-nav col-md-4">
                        <div class="panel">
                            <div class="user-heading round">
                                <!--<i class="fa fa-user fa-5x" aria-hidden="true"></i>-->
                                  <a href="#">
                                      
                                      <img src="img/<% out.print(u.getImguser()); %>" alt="">
                                  </a>
                                <h1>
                                    <%
                                        out.print(u.getNomPrenom());
                                    %>    
                                </h1>
                            </div>
                            <ul class="nav nav-pills nav-stacked">
                                <li id="activite" class=""><a href="home.jsp"> <i class="fa fa-user"></i> Activit&eacute;s</a></li>
                                <li id="profile"><a href="profile.jsp?uid=<% out.print(u.getIduser());%>"> <i class="fa fa-info-circle"></i> Profile</a></li>
                                <li id="abonnes"><a href="abonnes.jsp"> <i class="fa fa-users"></i> Abonn&eacute;s</a></li>
                            </ul>
                        </div>
                        <script>
                        </script>
                        <!-- Friends activity -->
                        <div class="widget" ng-controller="notifCtrl">
                            <div class="widget-header">
                                <h3 class="widget-caption">Activit&eacute;s des amis</h3>
                            </div>
                            <div class="widget-body bordered-top bordered-red" >
                                <div class="card">
                                    <div class="content" >
                                        <ul class="list-unstyled team-members">
                                            <li ng-repeat="activ in activities | orderBy:'-idpartage'| limitTo:5">
                                                <div class="row">
                                                    <div class="col-xs-3">
                                                        <div class="avatar">
                                                            <img src="img/{{activ.imguser}}" class="avatar" alt="user profile image">
                                                        </div>
                                                    </div>
                                                    <div ng-show="montrerpublierA(activ.nomprenompartageur)" class="col-xs-9">
                                                        <b>
                                                            <a href="profile.jsp?uid={{activ.idpartageur}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">
                                                                {{activ.nomprenom}}
                                                            </a>
                                                        </b>  a publi&eacute; 
                                                        <b>
                                                            une mise &agrave; jour
                                                        </b>.
                                                        <span class="timeago" >
                                                            {{tempsreel(activ.datepartage, activ.heurepartage)}}
                                                        </span>
                                                    </div>
                                                    <div ng-show="montrerpartagerA(activ.nomprenompartageur)" class="col-xs-9">
                                                        <div class="col-xs-9" ng-show="montrerpartagesaproprepublicationA(activ.iduser, activ.idpartageur)">
                                                            <b><a href="profile.jsp?uid={{activ.idpartageur}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">{{activ.nomprenompartageur}}</a></b> a partag&eacute;
                                                            <b>sa propre publication</b>. 
                                                            <span class="timeago" >{{tempsreel(activ.datepartage, activ.heurepartage)}}</span>
                                                        </div>
                                                        <div class="col-xs-9" ng-hide="montrerpartagesaproprepublicationA(activ.iduser, activ.idpartageur)">
                                                            <b><a href="profile.jsp?uid={{activ.idpartageur}}&midh=<% out.print(u.getIduser()); %>" class="post-user-name">{{activ.nomprenompartageur}}</a></b> 
                                                            <b>a partag&eacute; la publication de </b> 
                                                            <b><a href="profile.jsp?uid={{activ.iduser}}&midh=<% out.print(u.getIduser());%>&idshare={{activ.idpartageur}}" class="post-user-name">{{activ.nomprenom}}.</a></b>. 
                                                            <span class="timeago" >{{tempsreel(activ.datepartage, activ.heurepartage)}}</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div><!-- End Friends activity -->										 			      
                    </div><!-- end left content-->
                    <!-- right  content-->
                    <div class="profile-info col-md-8  animated">

