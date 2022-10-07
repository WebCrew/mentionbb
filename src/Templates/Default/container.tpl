<!DOCTYPE html>
<html lang="{{ app.sub.lang.default.id }}" 
    dir="{{ app.sub.lang.default.text_direction }}" 
    hook-action="{Mention:App-domEvent-htmldoc}">
<head hook-action="{Mention:App-domEvent-head}">
	{# Metadata is generated automatically. #}
	
	<!-- CSS -->
	<link rel="stylesheet" href="{{ app.public_dir }}/vendor/vendor.css?v=1644274312" />
	<link rel="stylesheet" href="{{ app.sub.theme.compile.makeCss('themes/frontend/assets', 'core')}}" />

	{% for styleitem in app.event.getStyles %}
		<!-- Extra CSS -->
		<link rel="stylesheet" href="{{ app.sub.theme.compile.minify('vendor', styleitem.file) }}">
	{% endfor %}
	{% block extra_styles %}{% endblock %}

    <style hook-action="{Mention:App-domEvent-docstyle}"></style>

	<link rel="icon" type="image/png" href="{{ app.public_dir }}/images/logo-favicon.png" sizes="32x32" />
</head>

{% if app.cookie.night_mode is same as('true') %}
	{% set night_mode_class = ' app-night-mode' %}
{% endif %}

<body hook-action="{Mention:App-domEvent-htmlbody}" 
    class="app-container{{ night_mode_class }}" 
    data-template="{% block app_template_name %}{% endblock %}" 
    data-color="{{ app.cookie.night_mode ? '#37474f' : '#fff' }}">
	{% include 'navbar.tpl' %}
	{% if app.user.getActiveBan(app.visitor.user_id) %}
	    {% set banItem = app.user.getActiveBan(app.visitor.user_id) %}
	    <div class="container mb-4 row">
			<aside class="col-sm-12">
				<div class="app-banning-flag guest-welcome-area text-dark shadow-sm rounded">
					<h5>{{ app.sub.lang.string.container.visitor.ban.title }}</h5>
					<div class="font-weight-bold">{{ app.sub.lang.string.container.visitor.ban.reason_title }}</div>
					<ul class="list-unstyled my-3">
						<li>
							<ul>
								<li>{{ banItem.text }}</li>
							</ul>
						</li>
					</ul>
					<div class="font-weight-bold">{{ app.sub.lang.parse.Parse('container.visitor.ban.expires_in', app.timer.date.getFullDate(banItem.expires)) }}</div>
				</div>
			</aside>
	    </div>
	{% endif %}
	<div hook-action="{Mention:App-domEvent-pagecontent}" 
        class="app-page-content container mb-4 row">
		    {% block content %}{% endblock %}
	</div>

	{% if not app.user.loggedIn() %}
		<div class="modal custom-modal animate slideIn" id="login-attempt" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content shadow-lg rounded">
					<div class="modal-header justify-content-lg-center d-flex">
						<span class="font-weight-bold h5 mb-0 ml-lg-auto mr-lg-auto">{{ app.sub.lang.string.container.visitor.login.title }}</span>
						<span class="close d-lg-none ml-auto" data-dismiss="modal" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></span>
					</div>
					<div class="modal-body">
						<div class="logo text-center mb-3">
							{% include 'logo.tpl' %}
						</div>
						<form method="post" action="{{ app.settings.site_url }}/auth/login">
							<input type="hidden" name="csrf_token" value="{{ app.csrf_token }}" />
							<div class="form-group">
								<input type="text" name="username" class="form-control" placeholder="{{ app.sub.lang.string.container.visitor.placeholder.username }}" required="required">
							</div>
							<div class="form-group">
								<input type="password" name="password" class="form-control" placeholder="{{ app.sub.lang.string.container.visitor.placeholder.password }}" required="required">
							</div>
							<div class="form-check">
								<input name="keep-login" type="checkbox" class="form-check-input" id="exampleCheck1" checked="checked">
								<label class="form-check-label" for="exampleCheck1">{{ app.sub.lang.string.container.visitor.login.remember_me }}</label>
							</div>
							<button name="login-submit" type="submit" class="btn btn-app-login no-anim-ui">{{ app.sub.lang.string.container.visitor.buttons.login }}</button>
						</form>
					</div>
					<div class="modal-body pl-2 pr-2 bg-light text-center">
						<div class="d-flex justify-content-center">
							<div class="legend">{{ app.sub.lang.string.container.generic.or }}</div>
						</div>
						{% include 'social_login_buttons.tpl' %}
					</div>
					<div class="modal-body bg-white text-center text-dark">
						{{ app.sub.lang.string.container.visitor.login.none|raw }}
					</div>
				</div>
			</div>
		</div>

	    <div class="modal custom-modal animate slideIn" id="register-attempt" tabindex="-1" role="dialog">
	    	<div class="modal-dialog" role="document">
	    		<div class="modal-content shadow-lg rounded">
	    			<div class="modal-header justify-content-lg-center d-flex">
	    				<span class="font-weight-bold h5 mb-0 ml-lg-auto mr-lg-auto">{{ app.sub.lang.string.container.visitor.register.title }}</span>
	    				<span class="close d-lg-none ml-auto" data-dismiss="modal" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></span>
	    			</div>
	    			<div class="modal-body">
	    				<div class="logo text-center mb-3">
	    					{% include 'logo.tpl' %}
	    				</div>
	    				<span class="close d-none" data-dismiss="modal" aria-label="Close"></span>
	    				<form method="post" action="{{ app.settings.site_url }}/auth/register">
	    					<input type="hidden" name="csrf_token" value="{{ app.csrf_token }}" />
	    					<div class="form-group">
	    						<input type="email" name="mail" class="form-control" placeholder="E-Posta" required="required">
	    						<small id="emailHelp" class="form-text mt-2">{{ app.sub.lang.string.container.visitor.register.mail_small }}</small>
	    					</div>
	    					<div class="form-group">
	    						<input type="text" name="username" class="form-control" placeholder="{{ app.sub.lang.string.container.visitor.placeholder.username }}" required="required">
	    						<div class="post-loader-spin"></div>
	    						<small id="username-control" class="form-text mt-2"></small>
	    					</div>
	    					<div class="form-group">
	    						<input type="password" name="password" class="form-control" placeholder="{{ app.sub.lang.string.container.visitor.placeholder.password }}" required="required">
	    					</div>
	    					<div class="form-check">
	    						<input name="quick-login" type="checkbox" class="form-check-input" id="quickLogin" checked="checked">
	    						<label title="{{ app.sub.lang.string.container.visitor.register.quick_login }}" class="form-check-label" for="quickLogin">{{ app.sub.lang.string.container.visitor.register.quick_login_title }}</label>
	    					</div>
	    					<div class="form-check">
	    						<input name="quick-login" type="checkbox" class="form-check-input" id="agreement" required="required">
	    						<label class="form-check-label" for="agreement">{{ app.sub.lang.parse.Parse('container.visitor.register.agreement', app.phrase.buildLink('pages', {}))|raw }}</label>
	    					</div>
	    					<div>
	    						<div class="g-recaptcha" data-sitekey="{{ app.settings.gr_site_key }}" data-callback="verifyRecaptchaCallback" data-expired-callback="expiredRecaptchaCallback"></div>
	    						 <input class="form-control d-none" data-recaptcha="true" required />
	    						 <small id="g-recaptcha-error" class="form-text mt-2 not-available d-none">{{ app.sub.lang.string.container.visitor.register.please_verify_captcha }}</small>
	    					</div>
	    					<button name="login-submit" type="submit" class="btn btn-app-login no-anim-ui">{{ app.sub.lang.string.container.buttons.complete }}</button>
	    				</form>
	    				<p class="text-muted font-weight-normal mt-3 mb-0 desc">{{ app.sub.lang.string.container.visitor.register.desc }}</p>
	    			</div>
	    			<div class="modal-body pl-2 pr-2 bg-light text-center">
	    				<div class="d-flex justify-content-center">
	    					<div class="legend">{{ app.sub.lang.string.container.generic.or }}</div>
	    				</div>
	    				{% include 'social_login_buttons.tpl' %}
	    			</div>
	    			<div class="modal-body bg-white text-center text-dark">
	    				<p>{{ app.sub.lang.string.container.visitor.register.or_login|raw }}</p>
	    			</div>
	    		</div>
	    	</div>
	    </div>

	    <div class="modal custom-modal animate slideIn" id="forgot-password-attempt" tabindex="-1" role="dialog">
	    	<div class="modal-dialog" role="document">
	    		<div class="modal-content shadow-lg rounded">
	    			<div class="modal-header justify-content-lg-center d-flex">
	    				<span class="font-weight-bold h5 mb-0 ml-lg-auto mr-lg-auto">{{ app.sub.lang.string.container.visitor.forgot.title }}</span>
	    				<span class="close d-lg-none ml-auto" data-dismiss="modal" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></span>
	    			</div>
	    			<div class="modal-body">
	    				<form method="post" action="{{ app.settings.site_url }}/account/forgot">
	    					<div class="form-group">
	    						<input type="email" name="mail" class="form-control" placeholder="{{ app.sub.lang.string.container.visitor.placeholder.mail }}" required="required" autocomplete="off">
	    						<small id="username-control" class="form-text mt-2">{{ app.sub.lang.string.container.visitor.forgot.text }}</small>
	    					</div>
	    					<button type="submit" class="btn btn-app-complete no-anim-ui">{{ app.sub.lang.string.container.buttons.submit }}</button>
	    				</form>
	    			</div>
	    		</div>
	    	</div>
	    </div>
    {% endif %}

    <div class="alert alert-dismissible text-center cookiealert" role="alert">
		<div class="cookiealert-container d-flex justify-content-center align-items-center">
			<span class="flex-grow-1">{{ app.sub.lang.parse.Parse('container.cookie_text', app.phrase.buildLink('pages', {}))|raw }}</span>
			<button type="button" class="acceptcookies" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></button>
		</div>
	</div>

	{% if app.user.loggedIn() %}
		<div class="modal custom-modal animate slideIn" id="sign-out-confirmation" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content shadow-lg rounded">
					<div class="modal-header justify-content-lg-center d-flex">
						<span class="font-weight-bold h5 mb-0 ml-lg-auto mr-lg-auto">{{ app.sub.lang.string.container.visitor.sign_out.title }}</span>
						<span class="close d-lg-none ml-auto" data-dismiss="modal" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></span>
					</div>
					<div class="modal-body">
						<div class="big-icon sign-out text-center mb-3"></div>
						<p class="font-weight-normal text-center">{{ app.sub.lang.string.container.visitor.sign_out.text }}</p>
						<form method="post" action="{{ app.settings.site_url }}/account/sign-out">
							<div class="d-flex">
								<button type="submit" class="btn btn-app-complete no-anim-ui">{{ app.sub.lang.string.container.buttons.approve }}</button>
								<button type="button" class="btn btn-app-complete cancel no-anim-ui ml-4" data-dismiss="modal">{{ app.sub.lang.string.container.buttons.cancel }}</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	{% endif %}

	<div class="app-alert-container">
    	<div class="app-alert text-center shadow">
    		<span></span>
    	</div>
    </div>

    {% if app.session.has('session_alert_message') %}
	    <div class="app-alert-container alert-login">
	    	<div class="app-alert text-center shadow animate slideIn d-block">
	    		<span>{{ app.session.get('session_alert_message') }}</span>
	    	</div>
	    </div>
	    {{ app.session.remove('session_alert_message') }}
    {% endif %}

    {% if app.user.loggedIn() %}
    	{% if option._route is same as('PublicApp_IndexAction') or option._route is same as('PublicApp_Discussion') or option._route is same as('PublicApp_Shortcode') %}
		    <script class="app_EditorToolbars" type="application/json">
    		{% autoescape false %}
    		    {{ app.sub.editor.buttons.getToolbars()|json_encode(constant('JSON_UNESCAPED_UNICODE') b-or constant('JSON_UNESCAPED_SLASHES')) }}
    		{% endautoescape %}
    		</script>
			<script class="app_EditorToolbarIcons" type="application/json">
    		{% autoescape false %}
    		    {{ app.sub.editor.buttons.getToolbarIcons()|json_encode(constant('JSON_UNESCAPED_UNICODE') b-or constant('JSON_UNESCAPED_SLASHES')) }}
    		{% endautoescape %}
    		</script>
			<script class="app_EditorButtons" type="application/json">
    		{% autoescape false %}
    		    {{ app.sub.editor.buttons.getButtons()|json_encode(constant('JSON_UNESCAPED_UNICODE') b-or constant('JSON_UNESCAPED_SLASHES')) }}
    		{% endautoescape %}
    		</script>
    		<script class="app_EditorLanguage" type="application/json">
    		{% autoescape false %}
    		    {{ app.sub.lang.string.editor|json_encode(constant('JSON_UNESCAPED_UNICODE') b-or constant('JSON_UNESCAPED_SLASHES') b-or constant('JSON_PRETTY_PRINT')) }}
    		{% endautoescape %}
    		</script>
    	{% endif %}
    {% endif %}

	<!-- Editor -->
	<script type="text/javascript" src="{{ app.sub.theme.compile.makeJs('vendor/app', 'editor') }}"></script>

	<!-- Main bundle -->
	<script type="text/javascript" src="{{ app.public_dir }}/vendor/vendor.js?v=1645718920"></script>

	<!-- App Core -->
	<script type="text/javascript" src="{{ app.sub.theme.compile.makeJs('vendor/app', 'core') }}"></script>

	{% if not app.user.loggedIn() or app.request.getPathInfo == '/pages/contact' %}
		<script src="https://www.google.com/recaptcha/api.js"></script>
	{% endif %}

	{% for jsitem in app.event.getScripts %}
		<!-- Extra JS -->
		<script type="text/javascript" src="{{ app.sub.theme.compile.minify('vendor', jsitem.file) }}"></script>
	{% endfor %}
    {% block extra_scripts %}{% endblock %}

	<script hook-action="{Mention:App-domEvent-docscript}">
	jQuery.extend(true, app, {
		config: {
			settings: {
				site_url: "{{ app.settings.site_url }}",
				public_dir: "{{ app.public_dir }}",
                ajax_path: "{{ app.ajax_path }}",

				site_title: "{{ app.settings.site_title }}",

				title_char_min: "{{ app.settings.title_char_min }}",
				content_char_min: "{{ app.settings.content_char_min }}",
				attachment_max: "{{ app.settings.max_attachments }}",
				attachment_max_size: "{{ app.settings.attachment_max_size|toByte }}",
				profile_photo_max_size: "{{ app.settings.profile_photo_max_size|toByte }}",

				logo: {
					light: "{{ app.public_dir }}/images/{{ app.settings.site_logo }}",
					night: "{{ app.public_dir }}/images/{{ app.settings.site_logo_night }}",
				},

				emoticon_database: "{{ app.settings.emoticon_database }}",

				editor: {
					image_filepicker_types: "{{ app.phrase.allowFormatsForImageUpload('extension') }}"
				}
			}
		},
		{% if app.user.loggedIn() %}

		visitor: {
			user_id: "{{ app.visitor.user_id }}",
			username: "{{ app.visitor.username }}"
 		},
 		{% endif %}

		phrases: {
			copy: "{{ app.sub.lang.string.container.buttons.copy }}",
			proceed: "{{ app.sub.lang.string.container.proceed }}",
			
			username_available: "{{ app.sub.lang.string.container.visitor.register.username_available }}",
			username_not_available: "{{ app.sub.lang.string.container.visitor.register.username_not_available }}",

			editor_placeholder: "{{ app.sub.lang.string.container.editor.placeholder.new_post }}",

			title_cannot_be_blank: "{{ app.sub.lang.string.error.editor.title_cannot_be_blank }}",
			title_is_greater_then: "{{ app.sub.lang.parse.Parse('error.editor.title_is_greater_then', app.settings.title_char_min) }}",
			content_is_greater_then: "{{ app.sub.lang.parse.Parse('error.editor.content_is_greater_then', app.settings.content_char_min) }}",
			attachment_max: "{{ app.sub.lang.parse.Parse('error.editor.attachment_max', app.settings.max_attachments) }}",
			attachment_max_size: "{{ app.sub.lang.parse.Parse('error.editor.attachment_max_size', app.settings.attachment_max_size) }}",
			profile_photo_max_size: "{{ app.sub.lang.parse.Parse('error.editor.profile_photo_max_size', app.settings.profile_photo_max_size) }}",
			please_select_a_forum: "{{ app.sub.lang.string.error.editor.please_select_a_forum }}",

			report_cannot_be_blank: "{{ app.sub.lang.string.error.editor.report_cannot_be_blank }}",

			discussion_is_locked: "{{ app.sub.lang.string.discussion.locked_text }}",

			expand: "{{ app.sub.lang.string.discussion.posts.buttons.expand }}",
			code_block: "{{ app.sub.lang.string.discussion.posts.code_block.title }}",
			{% if app.user.loggedIn() %}

			alert_messages: {
				wait_a_while: "{{ app.sub.lang.string.container.flash_message.wait_a_while }}",

				copy_to_clipboard: "{{ app.sub.lang.string.container.flash_message.copy_to_clipboard }}",

				two_step_verification_code_error: "{{ app.sub.lang.string.container.flash_message.two_step_verification_code_error }}",

				report_post: "{{ app.sub.lang.string.container.flash_message.report_post }}",
				delete_post: "{{ app.sub.lang.string.container.flash_message.delete_post }}",
				edit_post: "{{ app.sub.lang.string.container.flash_message.edit_post }}",

				attachment_deleted_successfull: "{{ app.sub.lang.string.container.flash_message.attachment_deleted_successfull }}",

				bookmark_post: "{{ app.sub.lang.string.container.flash_message.bookmark_post }}",
				unbookmark_post: "{{ app.sub.lang.string.container.flash_message.unbookmark_post }}",

				subscribe_success: "{{ app.sub.lang.string.discussion.subscribe.success }}",
				subscribe_remove: "{{ app.sub.lang.string.discussion.subscribe.remove }}",
				subscribe_allready: "{{ app.sub.lang.string.discussion.subscribe.allready }}",

				add_friend: "{{ app.sub.lang.string.container.flash_message.add_friend }}",
				remove_friend: "{{ app.sub.lang.string.container.flash_message.remove_friend }}",

				account_settings_success: "{{ app.sub.lang.string.container.flash_message.account_settings_success }}",
				account_passwords_must_much: "{{ app.sub.lang.string.container.flash_message.account_passwords_must_much }}",
				account_password_success: "{{ app.sub.lang.string.container.flash_message.account_password_success }}",

				messages_archived: "{{ app.sub.lang.string.container.flash_message.messages_archived }}",
				messages_removed_archive: "{{ app.sub.lang.string.container.flash_message.messages_removed_archive }}",
				messages_write_a_username: "{{ app.sub.lang.string.container.flash_message.messages_write_a_username }}",
				messages_write_a_title: "{{ app.sub.lang.string.container.flash_message.messages_write_a_title }}",
				messages_not_self: "{{ app.sub.lang.string.container.flash_message.messages_not_self }}",

				not_saving_content: "{{ app.sub.lang.string.container.flash_message.not_saving_content }}"
			}
			{% endif %}

		}
	});
	</script>
</body>
</html>