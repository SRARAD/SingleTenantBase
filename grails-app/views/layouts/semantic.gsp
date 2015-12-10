<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Single Tenant Base"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.0.4/semantic.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.0.4/semantic.min.css" type="text/css">
		<asset:stylesheet href="custom.css" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/0.5.0/sweet-alert.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/0.5.0/sweet-alert.css" type="text/css">

		<g:layoutHead/>
		<r:layoutResources />
	</head>

	<body>
		<div class="ui segment">
			<div class="ui two column grid">
				<div class="column">
					<a href="${createLink(uri: '/')}">
						<img class="ui image" src="https://s3.amazonaws.com/stb-content/RAD.png" style="max-height: 80px;" />
					</a>
				</div>
				<div class="column" style="text-align: right;">
					<img class="ui image" style="display: inline-block;margin-top:5px;" src="https://s3.amazonaws.com/stb-content/CSRA_Logo.svg" />				
				</div>
			</div>
		</div>
		<div class="menu-wrapper">
			<sec:ifLoggedIn>
				<div class="ui menu">
					<a class="item menu-home" href="/">
						<i class="icon home"></i>
						Home
					</a>
					<div class="right menu">
						<div class="ui dropdown item">
							<sec:username/><i class="icon dropdown"></i>
							<div class="menu">
								<g:link class="item" controller="logout">
									<i class="icon sign out"></i> Logout
								</g:link>
							</div>
						</div>
					</div>
				</div>
			</sec:ifLoggedIn>
		</div>

		<div class="content">
			<g:layoutBody/>
		</div>

		<div class="menu-wrapper">
			<div class="ui segment" style="margin-bottom: 15px;">
				<b>Single Tenant Base ${grailsApplication.metadata['app.version']}</b>
			</div>
		</div>

		<r:layoutResources />
		<script>
			var activeMenu = function(id) {
				if ($('.menu-' + id).is('a')) {
					$('.menu-' + id).addClass('active');
				} else {
					$('.menu-' + id).addClass('selected');
				}
			};
			$(function() {
				$('.ui.dropdown').dropdown({
					on: 'hover'
				});
			});
		</script>
	</body>
</html>
