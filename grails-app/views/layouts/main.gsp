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
		<script src="${resource(dir: 'static/js', file: 'jquery-2.1.0.js')}"></script>
		<script src="${resource(dir: 'static/js', file: 'chosen.jquery.js')}"></script>
		<script src="${resource(dir: 'static/js', file: 'jquery.blockUI.js')}"></script>
		<!-- <script src="${resource(dir: 'static/js', file: 'jquery.jqpagination.js')}"></script> -->
		<link rel="shortcut icon" href="${resource(dir: 'static/images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'static/images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'static/images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'static/css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'static/css', file: 'mobile.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'static/css', file: 'chosen.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'static/css', file: 'custom.css')}" type="text/css">
		<!-- <link rel="stylesheet" href="${resource(dir: 'static/css', file: 'jqpagination.css')}" type="text/css"> -->
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		<div id="logo" role="banner">
			<a href="${createLink(uri: '/')}"><img src="${resource(dir: 'static/images', file: 'RAD.png')}" alt="Rapid Application Devlopment"/></a>
		</div>
		<div id="loginHeader">
			<sec:ifLoggedIn>
				<sec:username/>
				[${link(action:"local",controller:"saml"){"Logout"}}]
			</sec:ifLoggedIn>
			<sec:ifNotLoggedIn>
				[${link(action:"auth",controller:"login"){"Login"}}]
			</sec:ifNotLoggedIn>
		</div>
		<g:layoutBody/>
		<div class="footer" role="contentinfo" style="text-align: right;">
			<b>Version ${ grailsApplication.metadata['app.version'] }</b>
		</div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
