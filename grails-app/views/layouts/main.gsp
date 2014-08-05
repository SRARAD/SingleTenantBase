<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="${resource(dir: 'js', file: 'jquery-2.1.0.js', absolute: true)}"></script>
		<script src="${resource(dir: 'js', file: 'chosen.jquery.js', absolute: true)}"></script>
		<script src="${resource(dir: 'js', file: 'jquery.blockUI.js', absolute: true)}"></script>
		<!-- <script src="${resource(dir: 'js', file: 'jquery.jqpagination.js', absolute: true)}"></script> -->
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico', absolute: true)}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png', absolute: true)}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png', absolute: true)}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css', absolute: true)}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css', absolute: true)}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'chosen.css', absolute: true)}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'custom.css', absolute: true)}" type="text/css">
		<!-- <link rel="stylesheet" href="${resource(dir: 'css', file: 'jqpagination.css', absolute: true)}" type="text/css"> -->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="logo" role="banner">
			<a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'RAD.png', absolute: true)}" alt="Rapid Application Devlopment"/></a>
			<div style="float: right;">
				<g:link controller="home" action="rad">Powered by SRA's RAD</g:link>
			</div>
		</div>
		<div id="loginHeader">
			<sec:ifLoggedIn>
				<sec:username/>
				[${link(action:"index",controller:"logout"){"Logout"}}]
			</sec:ifLoggedIn>
			<sec:ifNotLoggedIn>
				[${link(action:"auth",controller:"login"){"Login"}}]
			</sec:ifNotLoggedIn>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo"></div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
