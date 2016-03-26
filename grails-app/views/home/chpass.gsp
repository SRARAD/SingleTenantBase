<html>
	<head>
		<meta name='layout' content='semantic'/>
		<title>Change Password</title>
	</head>
	<body>
		<div class='ui segment'>
			<div class='inner'>
				<g:if test='${flash.message}'>
				<div class='login_message'>${flash.message}</div>
				</g:if>
				<div class='ui dividing header'><h3>Please update your password...</h3></div>
				<g:form action='updatePassword' id='passwordResetForm' class='ui form' autocomplete='off'>
					<div class="ui header">
						<h4></h4> Username:   <sec:username/></h4>
					</div>
					<div class="field">
						<label for='password'>Current Password</label>
						<div class="field">
							<g:passwordField name='password' placeholder="Current Password" type="text" />
						</div>
					</div>
				 	<div class="field">
					 	<label for='password'>New Password</label>
						<div class="field">
							<g:passwordField name='password_new' placeholder="New Password" type="text" />
						</div>
					</div>
					<div class="field">
					<label for='password'>New Password (again)</label>
						<div class="field">
							<g:passwordField name='password_new_2' placeholder="New Password (again)" type="text" />
						</div>
					</div>
					<div class="field">
						<input class="ui primary button" type='submit' value='Change' />
					</div>
				</g:form>
			</div>
		</div>
	</body>
</html>
