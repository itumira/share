<%@ include file="template/top.jsp" %>
<script>
    $("#abonnes").removeClass("active");
    $("#profile").removeClass("active");
    $("#activite").addClass("active");
</script>

<div class="animated fadeIn container container-timeline">
    
    <div class="col-md-10 no-paddin-xs">
        <!-- notification list-->
        <div class="col-md-7 no-paddin-xs">
            <div class="panel panel-white post panel-shadow animated fadeInUp">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/guy-3.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Jonathan Smith</a>
                            liked your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow animated fadeInUp">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/guy-2.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Deyman Bejarano</a>
                            shared your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/woman-2.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Denny lawer</a>
                            shared your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/woman-3.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Martha cargrot</a>
                            liked your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/woman-4.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Carla dorla</a>
                            liked your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/woman-5.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Maria Bejarano</a>
                            liked your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>

            <div class="panel panel-white post panel-shadow">
                <div class="post-heading">
                    <div class="pull-left image">
                        <img src="img/Friends/guy-3.jpg" class="avatar" alt="user profile image">
                    </div>
                    <div class="pull-left meta">
                        <div class="title h5">
                            <a href="#" class="post-user-name">Jonathan Smith</a>
                            liked your <a href="#">Post</a>
                        </div>
                        <h6 class="text-muted time">5 seconds ago</h6>
                    </div>
                </div>
            </div>


            <div class="panel panel-white post-load-more panel-shadow text-center">
                <button class="btn btn-danger">
                    <i class="fa fa-refresh"></i>Load More...
                </button>
            </div>				
        </div><!-- notification list-->
    </div>
</div>

<%@ include file="template/bottom.jsp" %>
