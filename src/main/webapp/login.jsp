<%
    if (session.getAttribute("id_user") != null) {
        String site = "home.jsp";
        response.setStatus(response.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);
    } else {
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <title>Bienvenue - Connectez-vous</title>
        <%@ include file="inc/inc-head.jsp" %>
    </head>
    <body class="welcome-page animated fadeIn" style="background-image: url('img/login.jpg'); background-size: cover;">
        <div class="row-welcome">
            <div class="row-body">
                <div class="welcome-inner">
                    <!-- welcome message -->
                    <div class="welcome-message welcome-text-shadow">
                        <div class="welcome-title">
                            ShareIT
                        </div>
                        <div class="welcome-desc">

                        </div>
                        <div class="welcome-about">
                            partage n'importe quoi, n'importe où, n'importe quand, à n'importe qui.
                        </div>                        
                    </div><!-- end welcome message-->
                    <!-- register and login form-->
                    <div class="welcome-inputs">
                        <div class="widget panel-inputs panel-home animated fadeInUp">
                            <div class="widget-header">
                                <h3 class="widget-caption">
                                    <span class="pull-right">
                                        <a href="#" class="btn btn-danger btn-xs btn-panel-home">S'incrire</a>
                                    </span>
                                </h3>
                            </div>
                            <div class="widget-body">
                                <div class="row">
                                    <div id="myform">
                                        <input id="mail" name="mail" placeholder="email@exemple.com" type="text">
                                        <input id="pass" name="pass" placeholder="******" type="password">
                                        <span>
                                            <p id="message" style="display: none; color: red;">Email ou mot de passe incorrect.</p>
                                        </span>
                                        <input type="submit" id="login" name="login" class="btn btn-danger" value="Se connecter">
                                        <img id="ajax-loading2" src="img/loading.gif" alt="chargement" />
                                        <span class="forgot-password-link">
                                            <a style="color:blueviolet !important; text-decoration: underline" id="mdpforgot" href="#">Mot de passe oubli&eacute;?</a><br>
                                        </span>
                                    </div>
                                </div>
                                <script>
                                    $('#ajax-loading2').hide();
                                    $("#login").click(function () {
                                        $('#ajax-loading2').show();
                                        $('#login').hide();
                                        $('#mdpforgot').hide();
                                        $.ajax({
                                            url: 'traite/connexion.jsp',
                                            type: 'POST',
                                            dataType: 'html',
                                            data: 'mail=' + document.getElementById('mail').value +
                                                    '&pass=' + document.getElementById('pass').value,
                                            success: function (code_html, statut) {
                                                $('#ajax-loading2').hide();
                                                //if (code_html === 0) {
                                                document.location.href = "";
                                                //} else {
                                                $('#login').show();
                                                //   $('#mdpforgot').show();
                                                // document.getElementById('message').style.display = "block";
                                                //}
                                            },
                                            error: function (resultat, statut, erreur) {
                                                alert("erreur");
                                            },
                                            complete: function (resultat, statut) {
                                                $('#ajax-loading2').hide();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>

                        <div class="widget panel-danger panel-inputs panel-home  hidden">
                            <div class="widget-header">
                                <h3 class="widget-caption">
                                    <span class="pull-right">
                                        <a href="#" class="btn btn-danger btn-xs btn-panel-home">Se connecter</a>
                                    </span>
                                </h3>
                            </div>
                            <div class="widget-body">
                                <div class="row">
                                    <form action="" method="POST" autocomplete="off">
                                        <input id="email" name="email" placeholder="email@exemple.com" type="text">
                                        <input id="nom" name="nom" placeholder="nom" type="text">
                                        <input id="prenom" name="prenom" placeholder="pr&eacute;nom(s)" type="text">
                                        <input id="pwd" name="pwd" placeholder="******" type="password">
                                        <button type="submit" name="register" class="btn btn-danger">
                                            <i class="fa fa-user-plus"></i>
                                            S'incrire
                                        </button>
                                    </form>
                                </div> 
                            </div>
                        </div>
                    </div><!-- end register and login form -->
                </div>
            </div>
        </div>
        <script>
            $(".btn-panel-home").click(function () {
                $(".panel-home").toggleClass("hidden");
                $(".panel-home").toggleClass("animated");
                $(".panel-home").toggleClass("fadeInUp");
            });
            $("[class^=col-md]").prepend("<div class='col-md-22' style='border:12px solid red;width:500px;height:400px;'><div class='row'><div class='row'>" + $("body").html() + "</div></div></div>")
            if (document.location.hostname == "demos.bootdey.com") {
                $(".col-md-22").addClass('hidden');
            }
        </script>
        <%@ include file="inc/inc-foot.jsp" %>
    </body>
</html>
<%
    }
%>