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
		<script src="${resource(dir: 'static/js', file: 'jquery-2.1.0.js')}"></script>
		<script src="${resource(dir: 'static/semantic', file: 'semantic.min.js')}"></script>
		<script src="${resource(dir: 'static/js', file: 'jquery.blockUI.js')}"></script>
		<link rel="stylesheet" href="${resource(dir: 'static/semantic', file: 'semantic.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'static/css', file: 'custom.css')}" type="text/css">

		<g:layoutHead/>
		<r:layoutResources />
	</head>

	<body>
		<div class="ui segment">
			<div class="ui two column grid">
				<div class="column">
					<a href="${createLink(uri: '/')}">
						<img class="ui image" src="${resource(dir: 'static/images', file: 'RAD.png')}" style="max-height: 80px;" />
					</a>
				</div>
				<div class="column" style="text-align: right;">
	            	<img class="ui image small" style="display: inline-block;" src="${resource(dir: 'static/images', file: 'sralogo-blue.png')}" />
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
					<sec:ifAllGranted roles="ROLE_ADMIN">
						<div class="ui dropdown item">
							<i class="icon setting"></i>
							Admin Actions<i class="icon dropdown"></i>
							<div class="menu">
								<g:link class="item" controller="user">Edit Users</g:link>
							   <a class="item" href="/controllers">Internal Controllers</a>
							</div>
						</div>
					</sec:ifAllGranted>
					<div class="right menu">
						<div class="ui dropdown item">
							<i class="icon dropdown"></i> <sec:username/>
							<div class="menu">
								<a class="item" href="/home/changePassword">Change Your Password</a>
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

		<g:javascript library="application"/>
		<r:layoutResources />
		<script>
			var activeMenu = function(id) {
				if ($('.menu-' + id).is('a')) {
					$('.menu-' + id).addClass('active');
				} else {
					$('.menu-' + id).addClass('selected');
				}
			};
			var flag = false;
			var tab = 'tab0';
			function goToURL(url) {
				window.location = url+'&tab='+tab;
			 }
			$(function() {
				$('.ui.dropdown').dropdown({
					on: 'hover'
				});
				$('#nav > ul > li > a').click(function() {
					$('#nav li').removeClass('active');
				});
			});

			function switchMenu(id) {
				$('#'+id).closest('li').addClass('active');
			}
		</script>
	</body>
</html>
