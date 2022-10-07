{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/oauth_services' %}

{% block title %}{{ app.sub.lang.string.admin.oauth.title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminOAuthServices', {}) }}">{{ app.sub.lang.string.admin.oauth.title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	{% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="oauth">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3 pb-3">
				<div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.string.admin.oauth.title }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.oauth.desc }}</small>
                    </div>
                    <div class="ml-auto mt-lg-0 mt-3">
                        <a href="{{ app.phrase.buildLink('adminOAuthServices', {}) }}?addService" class="btn btn-app-discussion icon plus">{{ app.sub.lang.string.admin.oauth.buttons.add_service }}</a>
                    </div>
                </div>  
                <div class="d-flex flex-column align-items-center justify-content-center mt-3">
                    <div class="service-list-area w-100">
                        <form id="admin_services_edit" method="post">
                            <div id="servicesAccordion">
                                {% for item in string.social.getSites(false) %}
                                   {% set apiKeys = string.social.getKeys(item.api_keys) %}
                                   <div class="app-service bg-white shadow-sm position-relative mb-3 rounded" data-service-name="{{ item.name }}" data-service-id="{{ item.site_id }}">
                                        <div class="app-post">
                                            <a href="#" class="post-layout d-flex align-items-center border-top-0 px-2 p-1 collapsed" data-toggle="collapse" data-target="#adminOAuthService_{{ item.name }}-{{ item.site_id }}"
                                                aria-expanded="false" aria-controls="adminOAuthService_{{ item.name }}-{{ item.site_id }}">
                                                <div class="post-icon {{ item.name }}">
                                                    <i class="fab fa-{{ item.name }}"></i>
                                                </div>
                                                <div class="title ml-lg-0 ml-2 mr-auto">
                                                    <span class="font-weight-bold">{{ item.title }}</span>
                                                </div>
                                            </a>
                                        </div>
                                        <div id="adminOAuthService_{{ item.name }}-{{ item.site_id }}" class="collapse" aria-labelledby="adminOAuthService_{{ item.name }}-{{ item.site_id }}" data-parent="#servicesAccordion">
                                            <div class="p-2">
                                                <div class="form-group row flex-lg-row flex-column mx-auto">
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label for="static_name_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.name.title }}</label>
                                                        <div>
                                                            <input class="form-control" name="options[name]" id="static_name_{{ item.name }}" type="text" aria-label="{{ item.name }}" value="{{ item.name }}" aria-describedby="help_name_{{ item.name }}" spellcheck="false" required="required">
                                                            <small id="help_name_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.name.desc|raw }}</small>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-12">
                                                        <label for="static_title_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.title.title }}</label>
                                                        <div>
                                                            <input class="form-control" name="options[title]" id="static_title_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.oauth.forms.title.desc }}" aria-label="{{ item.title }}" value="{{ item.title }}" aria-describedby="help_title_{{ item.name }}" spellcheck="false" required="required">
                                                            <small id="help_title_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.title.desc }}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row flex-lg-row flex-column mx-auto">
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label for="static_sitekey_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.site_key.title }}</label>
                                                        <div>
                                                            <input class="form-control" name="options[site_key]" id="static_sitekey_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.oauth.forms.site_key.desc }}" aria-label="{{ apiKeys.site_key }}" value="{{ apiKeys.site_key }}" aria-describedby="help_sitekey_{{ item.name }}" spellcheck="false">
                                                            <small id="help_sitekey_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.site_key.desc }}</small>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-12">
                                                        <label for="static_secretkey_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.secret_key.title }}</label>
                                                        <div>
                                                            <input class="form-control" name="options[secret_key]" id="static_secretkey_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.oauth.forms.secret_key.desc }}" aria-label="{{ apiKeys.secret_key }}" value="{{ apiKeys.secret_key }}" aria-describedby="help_secretkey_{{ item.name }}" spellcheck="false">
                                                            <small id="help_secretkey_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.secret_key.desc }}</small>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row flex-lg-row flex-column mx-auto">
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label for="static_callback_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.callback.title }}</label>
                                                        <div>
                                                            {% if item.callback is not same as('') %}
                                                                <div class="input-callback">
                                                                    <input class="form-control text-transparent" name="options[callback]" id="static_callback_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.oauth.forms.callback.placeholder }}" aria-label="{{ item.callback }}" value="{{ item.callback }}" aria-describedby="help_callback_{{ item.name }}" spellcheck="false" required="required">
                                                                    <div class="js-ClickableDivs" data-text="{{ item.callback }}"></div>
                                                                </div>
                                                            {% else %}
                                                                <input class="form-control" name="options[callback]" id="static_callback_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.oauth.forms.callback.placeholder }}" aria-label="{{ item.callback }}" value="{{ item.callback }}" aria-describedby="help_callback_{{ item.name }}" spellcheck="false" required="required">
                                                                <span>{{ item.callback }}</span>
                                                            {% endif %}
                                                            <small id="help_callback_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.callback.desc|raw }}</small>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-12 mt-2 mt-lg-0">
                                                        <label for="static_is_active_{{ item.name }}" class="col-form-label">{{ app.sub.lang.string.admin.oauth.forms.is_active.title }}</label>
                                                        <div class="checkbox switcher">
                                                            <label for="help_is_active_{{ item.name }}">
                                                                <input type="checkbox" name="options[is_active]" id="help_is_active_{{ item.name }}" value="1"{{ item.is_active ? ' checked="checked"' : '' }}>
                                                                <span><small></small></span>
                                                                <small id="help_is_active_{{ item.name }}" class="text-muted">{{ app.sub.lang.string.admin.oauth.forms.is_active.desc }}</small>
                                                                <small id="help_is_active_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.oauth.forms.is_active.extra_desc }}</small>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <button type="submit" class="btn btn-app-discussion no-anim-ui icon pen">{{ app.sub.lang.string.container.buttons.update }}</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                {% endfor %}
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </aside>
{% endblock %}