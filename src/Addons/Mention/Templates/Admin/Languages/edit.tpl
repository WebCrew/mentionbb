{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/languages/edit' %}

{% block title %}{{ app.sub.lang.parse.Parse('admin.languages.edit.title', string.language.title) }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminLanguages', {}) }}">{{ app.sub.lang.string.admin.languages.list.title }}</a></div>
                    <div><a href="{{ app.phrase.buildLink('adminLanguages', {}) }}?l={{ string.language.name }}">{{ string.language.title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	{% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="languages">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3 pb-3">
				<div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.parse.Parse('admin.languages.edit.title', string.language.title) }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.languages.edit.desc }}</small>
                    </div>
                    <div class="ml-auto mt-lg-0 mt-3">
                        <a href="{{ app.phrase.buildLink('adminLanguages', {}) }}" class="btn btn-app-discussion icon back">{{ app.sub.lang.string.container.buttons.back }}</a>
                    </div>
                </div>  
                <div class="d-flex flex-column align-items-center justify-content-center mt-3">
                    <div class="service-list-area w-100">
                        <form id="admin_languages_edit" method="post">
                            <div id="servicesAccordion">
                                <div class="app-language app-service bg-white shadow-sm position-relative mb-3 rounded" data-name="{{ string.language.name }}">
                                    <div class="app-post">
                                        <div class="post-layout d-flex align-items-center border-top-0 px-2 p-1 collapse">
                                            <div class="post-icon">
                                                <span class="fi fi-{{ string.item.getFlag(string.language.id) }} --xs"></span>
                                            </div>
                                            <div class="head-title d-flex flex-column ml-lg-0 ml-2 mr-auto">
                                                <span class="font-weight-bold">{{ string.language.title }}</span>
                                                <small>{{ string.language.desc }}</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="p-2">
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_id_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.id.title }}</label>
                                                    <div>
                                                        <input name="options[id]" class="form-control" id="static_id_{{ string.language.id }}" type="text" aria-label="{{ string.language.id }}" value="{{ string.language.id }}" aria-describedby="help_id_{{ string.language.id }}" spellcheck="false" disabled>
                                                        <small id="help_id_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.id.desc }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_name_{{ string.language.name }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.name.title }}</label>
                                                    <div>
                                                        <input name="options[name]" class="form-control" id="static_name_{{ string.language.name }}" type="text" aria-label="{{ string.language.name }}" value="{{ string.language.name }}" aria-describedby="help_name_{{ string.language.name }}" spellcheck="false" disabled>
                                                        <small id="help_name_{{ string.language.name }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.name.desc }}</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_title_{{ string.language.title }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.title.title }}</label>
                                                    <div>
                                                        <input name="options[title]" class="form-control" id="static_title_{{ string.language.id }}" type="text" aria-label="{{ string.language.desc }}" value="{{ string.language.title }}" aria-describedby="help_title_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_title_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.title.desc }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_desc_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.desc.title }}</label>
                                                    <div>
                                                        <input name="options[desc]" class="form-control" id="static_desc_{{ string.language.id }}" type="text" aria-label="{{ string.language.desc }}" value="{{ string.language.desc }}" aria-describedby="help_desc_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_desc_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.desc.desc }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_dir_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.dir.title }}</label>
                                                    <div>
                                                        <input name="options[dir]" class="form-control" id="static_dir_{{ string.language.id }}" type="text" aria-label="{{ string.language.text_direction }}" value="{{ string.language.text_direction }}" aria-describedby="help_dir_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_dir_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.dir.desc }}</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_zone_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.zone.title }}</label>
                                                    <div>
                                                        <select name="options[zone]" class="custom-select custom-select-sm">
                                                            {% for zone in app.timer.date.getAllTimezones() %}
                                                                <option value="{{ zone }}" {{ zone is same as(string.language.timer.zone) ? 'selected' : '' }}>{{ zone }}</option>
                                                            {% endfor %}
                                                        </select>
                                                        <small id="help_zone_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.zone.desc }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_format_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.format.title }}</label>
                                                    <div>
                                                        <input name="options[format]" class="form-control" id="static_format_{{ string.language.id }}" type="text" aria-label="{{ string.language.timer.format }}" value="{{ string.language.timer.format }}" aria-describedby="help_format_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_format_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.format.desc|raw }}</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_date_format_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.date_format.title }}</label>
                                                    <div>
                                                        <input name="options[date_format]" class="form-control" id="static_date_format_{{ string.language.id }}" type="text" aria-label="{{ string.language.timer.date_format }}" value="{{ string.language.timer.date_format }}" aria-describedby="help_date_format_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_date_format_{{ string.language.timer.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.date_format.desc|raw }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_date_format_simple_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.date_format_simple.title }}</label>
                                                    <div>
                                                        <input name="options[date_format_simple]" class="form-control" id="static_date_format_simple_{{ string.language.id }}" type="text" aria-label="{{ string.language.timer.date_format_simple }}" value="{{ string.language.timer.date_format_simple }}" aria-describedby="help_date_format_simple_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_date_format_simple_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.date_format_simple.desc|raw }}</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_year_format_{{ string.language.id }}" class="col-form-label">{{ app.sub.lang.string.admin.languages.forms.year_format.title }}</label>
                                                    <div>
                                                        <input name="options[year_format]" class="form-control" id="static_year_format_{{ string.language.id }}" type="text" aria-label="{{ string.language.timer.year_format }}" value="{{ string.language.timer.year_format }}" aria-describedby="help_year_format_{{ string.language.id }}" spellcheck="false" required="required">
                                                        <small id="help_year_format_{{ string.language.id }}" class="form-text text-muted">{{ app.sub.lang.string.admin.languages.forms.year_format.desc|raw }}</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <button type="submit" class="btn btn-app-discussion no-anim-ui icon pen">{{ app.sub.lang.string.container.buttons.update }}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </aside>
{% endblock %}