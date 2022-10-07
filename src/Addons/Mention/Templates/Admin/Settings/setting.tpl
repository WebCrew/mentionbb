{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/settings' %}

{% block title %}{{ app.sub.lang.string.admin.settings.groups[string.group].title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminSiteSettings', {}) }}">{{ app.sub.lang.string.admin.settings.title }}</a></div>
                    <div><a href="{{ app.phrase.buildLink('adminSiteSettings', {}) }}?{{ string.group }}">{{ app.sub.lang.string.admin.settings.groups[string.group].title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	{% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="settings">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3">
                <div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.string.admin.settings.groups[string.group].title }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.settings.groups[string.group].desc }}</small>
                    </div>
                    <div class="app-select-setting dropdown ml-auto mt-lg-0 mt-3">
                        <button class="btn btn-app-dd no-anim-ui icon {{ string.group }} dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ app.sub.lang.string.admin.settings.groups[string.group].title }}</button>
                        <div class="dropdown-menu dropdown-menu-left custom-menu custom-menu-md custom-menu-auto shadow animate slideIn" aria-labelledby="dropdownMenuButton">
                            <div class="title">
                                <div>
                                    <span>{{ app.sub.lang.string.container.buttons.select }}</span>
                                </div>
                            </div>
                            {% for item in string.settings.getSettingGroups() %}
                                <div>
                                    <a class="notification quick-menu d-flex {% if string.group is same as(item.group_name) %}active {% endif %}" href="{{ app.phrase.buildLink('adminSiteSettings', {}) }}?{{ item.group_name }}">
                                        <div class="text ml-1">
                                            <span class="icon {{ item.group_name }}">{{ app.sub.lang.string.admin.settings.groups[item.group_name].title }}</span>
                                        </div>
                                    </a>
                                </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
                <form id="admin_settings" method="post" enctype="multipart/form-data">
                    <div class="d-flex flex-column align-items-start justify-content-center mt-3">
                        {% for item in string.settings.getSettingsFromGroupName(string.group) %}
                            <div class="setting-item w-100">
                                {% if item.type is same as('text') or item.type is same as('email') %}
                                    <div class="form-group row mx-auto" data-option="{{ item.name }}">
                                        <label for="static_{{ item.name }}" class="col-sm-4 col-form-label">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}</label>
                                        <div class="col-sm-8">
                                            <input class="form-control" name="options[{{ item.name }}]" id="static_{{ item.name }}" type="{{ item.type }}" placeholder="{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}" aria-label="{{ item.name }}" value="{{ item.value }}" aria-describedby="help_{{ item.name }}" spellcheck="false" required="required">
                                            <small id="help_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].desc|raw }}</small>
                                        </div>
                                    </div>
                                {% elseif item.type is same as('selectbox') %}
                                    <div class="form-group row mx-auto" data-option="{{ item.name }}">
                                        <label for="static_{{ item.name }}" class="col-sm-4 col-form-label">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}</label>
                                        <div class="col-sm-8">
                                            <select name="options[{{ item.name }}]" class="custom-select custom-select-sm mb-3">
                                                <option selected disabled>{{ app.sub.lang.string.container.buttons.select }}</option>
                                                {% if item.name is same as('default_language') %}
                                                    {% for language in app.sub.lang.parse.getLanguages() %}
                                                        <option value="{{ language.name }}" {% if app.settings.default_language is same as(language.name) %}selected {% endif %}>{{ language.title }}</option>
                                                    {% endfor %}
                                                {% endif %}
                                                {% if item.name is same as('default_theme') %}
                                                    {% for theme in app.sub.theme.loader.getThemes() %}
                                                        <option value="{{ theme }}" {% if app.settings.default_theme is same as(theme) %}selected {% endif %}>{{ theme }}</option>
                                                    {% endfor %}
                                                {% endif %}
                                            </select>
                                            <small id="help_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].desc|raw }}</small>
                                        </div>
                                    </div>
                                {% elseif item.type is same as('file') %}
                                    <div class="form-group row mx-auto" data-option="{{ item.name }}">
                                        <label for="static_{{ item.name }}" class="col-sm-4 col-form-label">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}</label>
                                        <div class="col-sm-8">
                                            <input type="file" class="custom-file-input" id="file_{{ item.name }}" name="file_{{ item.name }}" accept="image/x-png,image/svg+xml,image/jpeg">
                                            <label class="custom-file-label shadow-sm" for="file_{{ item.name }}" data-text="{{ app.sub.lang.string.container.buttons.browse }}">{{ item.value }}</label>
                                            <small id="help_{{ item.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].desc|raw }}</small>
                                        </div>
                                    </div>
                                {% elseif item.type is same as('filetext') %}
                                    <div class="app-admin-file-text form-group row position-relative mx-auto" data-option="{{ item.name }}"> 
                                        <label for="static_{{ item.name }}" class="col-sm-4 col-form-label">{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}</label>
                                        <div class="col-sm-8">
                                            <div class="input-group">
                                                <input class="form-control" name="options[{{ item.name }}]" id="static_{{ item.name }}" type="text" placeholder="{{ app.sub.lang.string.admin.settings.forms[item.group_name][item.name].name }}" aria-label="{{ item.name }}" value="{{ item.value }}" aria-describedby="help_{{ item.name }}" spellcheck="false">
                                                <input type="file" class="custom-file-input d-none" id="fileSetting[{{ item.name }}]" name="fileSetting[{{ item.name }}]" accept="image/x-png,image/svg+xml,image/jpeg">
                                                <label class="toggle-tooltip" for="fileSetting[{{ item.name }}]" title="{{ app.sub.lang.string.container.buttons.select_file }}"></label>
                                            </div>
                                            <small id="help_{{ item.name }}" class="form-text text-muted">{{ app.phrase.renderPhrase(app.sub.lang.string.admin.settings.forms[item.group_name][item.name].desc)|raw }}</small>
                                        </div>
                                    </div>
                                {% endif %}
                            </div>
                        {% endfor %}
                        <div class="w-100 d-inline-block">
                            <div class="sticky-button shadow">
                                <button type="submit" class="btn btn-app-discussion no-anim-ui icon send">{{ app.sub.lang.string.container.buttons.update }}</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </aside>
{% endblock %}
