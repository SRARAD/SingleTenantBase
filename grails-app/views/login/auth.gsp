<html>
	<head>
		<meta name='layout' content='semantic'/>
		<title><g:message code="springSecurity.login.title"/></title>
		<style>
			.content, .menu-wrapper {
				width: 600px;
				margin: 0 auto;
			}
		</style>
	</head>
	<body>
		<div class="ui segment">
			<div class="ui header"><g:message code="springSecurity.login.header"/></div>
	
			<g:if test="${flash.message}">
				<div class="ui negative message">
					<i class="close icon"></i>
					<div class="header">
						${flash.message}
					</div>
				</div>
			</g:if>
	
			<form action="${postUrl}" method="POST" autocomplete="off" class="ui form">
				<div class="two fields">
					<div class="field">
						<div class="ui labeled input">
							<div class="ui label teal">
								<g:message code="springSecurity.login.username.label"/>:
							</div>
							<g:field type="text" name="j_username" />
						</div>
					</div>
					<div class="field">
						<div class="ui labeled input">
							<div class="ui label teal">
								<g:message code="springSecurity.login.password.label"/>:
							</div>
							<g:field type="password" name="j_password" />
						</div>
					</div>
				</div>
				<div class="field">
					<div class="ui toggle checkbox">
						<g:checkBox name="${rememberMeParameter}" />
						<label><g:message code="springSecurity.login.remember.me.label"/></label>
					</div>
				</div>
				<div style="text-align: center;">
					<button class="ui primary button">${message(code: "springSecurity.login.button")}</button>
				</div>
			</form>
		</div>
		<script>
			$(function() {
				$('.ui.checkbox').checkbox();
				$('.message .close').on('click', function() {
					$(this).closest('.message').fadeOut();
				});
				$('#j_username').focus();
			});
		</script>
	</body>
</html>