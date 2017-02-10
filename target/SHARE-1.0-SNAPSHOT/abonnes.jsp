<%@page import="java.util.List"%>
<%@ include file="template/top.jsp" %>
<script>
    $("#activite").removeClass("active");
    $("#profile").removeClass("active");
    $("#abonnes").addClass("active");</script>
    <%
        List<Utilisateur> listeFollowing = u.getAbonnements();
        List<Utilisateur> listeFollowers = u.getAbonnes();
        List<Utilisateur> listeDemandeNotAnswered = u.getDemandesNotAnswered();
    %>
<div class="col-md-12  animated fadeInDown">
    <div class="profile-info-right">
        <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom">
            <li class="active"><a href="#activities" data-toggle="tab">ABONNES</a></li>
            <li><a href="#followers" data-toggle="tab">ABONNEMENTS</a></li>
            <li><a href="#following" data-toggle="tab">DEMANDES</a></li>
        </ul>
        <div class="tab-content">
            <!-- activities -->
            <div class="tab-pane fade in active" id="activities">
                <%
                    for (Utilisateur utili : listeFollowers) {
                %>
                <div class="media user-follower">
                    <img src="img/Friends/guy-2.jpg" alt="User Avatar" class="media-object pull-left">
                    <div class="media-body">
                        <a href="profile.jsp?uid=<%out.print(utili.getIduser());%>"><% out.print(utili.getNomPrenom());%></a><br>

                        <button id="neplussuivre<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-toggle-following pull-right"><i class="fa fa-checkmark-round"></i> <span>Suivi</span></button>
                        <button id="traitement<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-clock-o"></i> En attente</button>
                        <button id="suivre<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-plus"></i> Suivre</button>
                        <button id="annulerdemande<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-remove"></i> Annuler demande</button>
                        <input type="hidden" id="moi<% out.print(utili.getIduser()); %>" value="<%out.print(u.getIduser());%>">
                        <input type="hidden" id="lui<% out.print(utili.getIduser()); %>" value="<% out.print(utili.getIduser());%>">

                        <script>
                            $('#traitement<% out.print(utili.getIduser()); %>').hide();
                            <%
                                if (u.isFollowedToo(utili.getIduser())) {
                            %>
                            $('#neplussuivre<% out.print(utili.getIduser()); %>').show();
                            $('#annulerdemande<% out.print(utili.getIduser()); %>').hide();
                            $('#suivre<% out.print(utili.getIduser()); %>').hide();
                            <%
                            } else if (!u.isFollowedToo(utili.getIduser())) {
                                if (!u.askNotConfirmed(utili.getIduser())) {
                            %>
                            $('#annulerdemande<% out.print(utili.getIduser()); %>').hide();
                            $('#suivre<% out.print(utili.getIduser()); %>').show();
                            <%
                            } else {
                            %>
                            $('#annulerdemande<% out.print(utili.getIduser()); %>').show();
                            $('#suivre<% out.print(utili.getIduser()); %>').hide();
                            <%
                                    }
                                }
                            %>
                            $("#suivre<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement<% out.print(utili.getIduser()); %>').show();
                                $('#suivre<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/demandeabonnement.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#annulerdemande<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                            $("#annulerdemande<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement<% out.print(utili.getIduser()); %>').show();
                                $('#annulerdemande<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/annulerdemandeabonnement.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#suivre<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                            $("#neplussuivre<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement<% out.print(utili.getIduser()); %>').show();
                                $('#neplussuivre<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/neplussuivre.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#suivre<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <!-- end activities -->
            <!-- followers -->
            <div class="tab-pane fade" id="followers">
                <%
                    for (Utilisateur utili : listeFollowing) {
                %>
                <div class="media user-following">
                    <img src="img/Friends/guy-2.jpg" alt="User Avatar" class="media-object pull-left">
                    <div class="media-body">
                        <a href="profile.jsp?uid=<% out.print(utili.getIduser()); %>"><% out.print(utili.getNomPrenom());%></a>
                        <button id="neplussuivre2<% out.print(utili.getIduser()); %>"  type="button" class="btn btn-sm btn-danger pull-right"><i class="fa fa-close-round"></i> Ne plus suivre</button>
                        <button id="traitement2<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-clock-o"></i> En attente</button>
                        <button id="suivre2<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-plus"></i> Suivre</button>
                        <button id="annulerdemande2<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-remove"></i> Annuler demande</button>
                        <input type="hidden" id="moi2<% out.print(utili.getIduser()); %>" value="<%out.print(u.getIduser());%>">
                        <input type="hidden" id="lui2<% out.print(utili.getIduser()); %>" value="<% out.print(utili.getIduser());%>">

                        <script>
                            $('#traitement2<% out.print(utili.getIduser()); %>').hide();
                            <%
                                if (u.isFollowedToo(utili.getIduser())) {
                            %>
                            $('#neplussuivre2<% out.print(utili.getIduser()); %>').show();
                            $('#annulerdemande2<% out.print(utili.getIduser()); %>').hide();
                            $('#suivre2<% out.print(utili.getIduser()); %>').hide();
                            <%
                                }
                            %>
                            $("#suivre2<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement2<% out.print(utili.getIduser()); %>').show();
                                $('#suivre2<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/demandeabonnement.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi2<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui2<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#annulerdemande2<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement2<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                            $("#annulerdemande<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement2<% out.print(utili.getIduser()); %>').show();
                                $('#annulerdemande2<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/annulerdemandeabonnement.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi2<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui2<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#suivre2<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement2<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                            $("#neplussuivre2<% out.print(utili.getIduser()); %>").click(function () {
                                $('#traitement2<% out.print(utili.getIduser()); %>').show();
                                $('#neplussuivre2<% out.print(utili.getIduser());%>').hide();
                                $.ajax({
                                    url: 'traite/neplussuivre.jsp',
                                    type: 'POST',
                                    dataType: 'html',
                                    data: 'idmoi=' + document.getElementById('moi2<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('lui2<% out.print(utili.getIduser()); %>').value,
                                    success: function (code_html, statut) {
                                        //  alert(code_html);
                                        $('#suivre2<% out.print(utili.getIduser()); %>').show();
                                    },
                                    error: function (resultat, statut, erreur) {
                                        alert("erreur");
                                    },
                                    complete: function (resultat, statut) {
                                        $('#traitement2<% out.print(utili.getIduser()); %>').hide();
                                    }
                                });
                            });
                        </script>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <!-- end followers -->
            <!-- following -->
            <div class="tab-pane fade" id="following">
                <%
                    for (Utilisateur utili : listeDemandeNotAnswered) {
                %>
                <div class="media user-following">
                    <img src="img/Friends/guy-2.jpg" alt="User Avatar" class="media-object col-md-2">
                    <div class="col-md-7">
                        <a href="profile.jsp?uid=<% out.print(utili.getIduser()); %>"><% out.print(utili.getNomPrenom());%></a>
                        <button id="accepter<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-primary col-md-5"><i class="fa fa-checkmark-round"></i> Accepter</button>    
                        <button id="traitementaccept<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-clock-o"></i> En attente</button>
                    </div>
                    <button id="refuser<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-danger col-md-3"><i class="fa fa-close-round"></i> Refuser</button>
                    <button id="traitementrefuse<% out.print(utili.getIduser()); %>" type="button" class="btn btn-sm btn-default pull-right"><i class="fa fa-clock-o"></i> En attente</button>
                    <input type="hidden" id="moia<% out.print(utili.getIduser()); %>" value="<%out.print(u.getIduser());%>">
                    <input type="hidden" id="luia<% out.print(utili.getIduser()); %>" value="<% out.print(utili.getIduser());%>">
                </div>
                <script>
                    $('#traitementrefuse<% out.print(utili.getIduser()); %>').hide();
                    $('#traitementaccept<% out.print(utili.getIduser()); %>').hide();

                    $("#accepter<% out.print(utili.getIduser()); %>").click(function () {
                        $('#traitementaccept<% out.print(utili.getIduser()); %>').show();
                        $('#refuser<% out.print(utili.getIduser());%>').hide();
                        $.ajax({
                            url: 'traite/accepterdemande.jsp',
                            type: 'POST',
                            dataType: 'html',
                            data: 'idmoi=' + document.getElementById('moia<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('luia<% out.print(utili.getIduser()); %>').value,
                            success: function (code_html, statut) {
                                document.location.href = "";
                            },
                            error: function (resultat, statut, erreur) {
                                alert("erreur");
                            },
                            complete: function (resultat, statut) {
                                $('#traitementaccept<% out.print(utili.getIduser()); %>').hide();
                            }
                        });
                    });
                    $("#refuser<% out.print(utili.getIduser()); %>").click(function () {
                        $('#traitementrefuse<% out.print(utili.getIduser()); %>').show();
                        $('#accepter<% out.print(utili.getIduser());%>').hide();
                        $.ajax({
                            url: 'traite/refuserdemande.jsp',
                            type: 'POST',
                            dataType: 'html',
                            data: 'idmoi=' + document.getElementById('moia<% out.print(utili.getIduser()); %>').value + '&idlui=' + document.getElementById('luia<% out.print(utili.getIduser()); %>').value,
                            success: function (code_html, statut) {
                                document.location.href = "";
                            },
                            error: function (resultat, statut, erreur) {
                                alert("erreur");
                            },
                            complete: function (resultat, statut) {
                                $('#traitementrefuse<% out.print(utili.getIduser()); %>').hide();
                            }
                        });
                    });
                </script>
                <%
                    }
                %>
            </div>
            <!-- end following -->
        </div>
    </div>
</div>
<%@ include file="template/bottom.jsp" %>