<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html lang="en">
  <head>
	<meta charset="utf-8">
	<title>TaTaMi</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="Ippon Technologies">

	<!-- Le styles -->
	<link href="/assets/css/bootstrap.css" rel="stylesheet">
	<style>
	  body {
		padding-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
	  }
	</style>
	<link href="/assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="/assets/css/tatami-custom.css" rel="stylesheet">
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Le fav and touch icons -->
	<link rel="shortcut icon" href="../images/ippon.ico">
  </head>

  <body>

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="#">TaTaMi</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li class="active"><a href="#"><i class="icon-home icon-white"></i> Home</a></li>
                        <li><a href="/tatami/about"><i class="icon-info-sign icon-white"></i> About</a></li>
					</ul>
					<ul class="nav pull-right">
						<li class="divider-vertical"></li>
						<li class="close"><a href="/tatami/logout">logout &times;</a></li>
					</ul>
				</div><!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div class="alert alert-success">
		<h1>Tweets view</h1>
		<p>View your <a href="http://www.ippon.fr/" target="_blank">Ippon Technologies</a> tweets at a glance.</p>
	</div>

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span4">
				<div class="tabbable tabs-below">
					<div class="tab-content alert alert-info">
						<div class="tab-pane active" id="homeTab"></div>
						<div class="tab-pane" id="profileTab"></div>
					</div>
					<ul class="nav nav-tabs">
						<li class="active"><a id="defaultTab" href="#homeTab" data-toggle="tab">Home</a></li>
						<li><a href="#profileTab" data-toggle="tab">Profile</a></li>
					</ul>
				</div>
			</div>

			<div class="span8">
				<div class="tabbable tabs-right">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#view1" data-toggle="tab">Tweets</a></li>
						<li><a href="#view2" data-toggle="tab">Pie chart</a></li>
						<li><a href="#view3" data-toggle="tab">Time chart</a></li>
					</ul>
					<div class="tab-content alert alert-success">
						<div class="tab-pane active" id="view1"></div>
						<div class="tab-pane" id="view2">
							<h2>Howdy, I'm in Section 2.</h2>
						</div>
						<div class="tab-pane" id="view3">
							<h2>Howdy, I'm in Section 3.</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Le javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/assets/js/jquery.js"></script>
	<script src="/assets/js/bootstrap-tab.js"></script>

	<script src="/assets/js/tatami.js"></script>
	<script src="/assets/js/profile.js"></script>

	<script type="text/javascript">
        var login = "<sec:authentication property="principal.username"/>";

		$(document).ready(function() {
			// panneau de gauche
			$('#homeTab').load('/assets/fragments/home.html', refreshHome);
			$('#profileTab').load('/assets/fragments/profile.html');
        	// auto-refresh
		    $('a[data-toggle="tab"]').on('show', function (e) {
		    	if (e.target.hash == '#homeTab') {
					refreshHome();
		    	} else if (e.target.hash == '#profileTab') {
		        	displayProfile();
		        }
		    });

		    // panneau de droite
			$('#view1').load('/assets/fragments/timeline.html', listTweets);	//TODO WebSocket pour maj auto push
			//TODO #view2 et #view3
		});
	</script>
  </body>
</html>