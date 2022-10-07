{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/addons/list' %}

{% block title %}{{ app.sub.lang.string.admin.addons.list.title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminAddons', {}) }}">{{ app.sub.lang.string.admin.addons.list.title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	{% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="addons">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3 pb-3">
				<div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.string.admin.addons.list.title }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.addons.list.desc }}</small>
                    </div>
                    <div class="ml-auto mt-lg-0 mt-3">
                        <a href="{{ app.phrase.buildLink('adminAddons', {}) }}?install" class="btn btn-app-discussion icon plus">{{ app.sub.lang.string.container.buttons.install }}</a>
                    </div>
                </div>  
                <div class="d-flex flex-column align-items-center justify-content-center mt-3">
                    <div class="d-flex flex-lg-row flex-column align-items-lg-center w-100 mb-3">
                        <div class="app-admin-search js-AppAdmin_QuickSearchAddons search-container position-relative">
                            <div class="input-group has-feedback has-clear">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">{{ app.sub.lang.string.admin.addons.list.search.label }}</span>
                                </div>
                                <input class="form-control" type="text"
                                    placeholder="{{ app.sub.lang.string.admin.addons.list.search.placeholder }}"
                                    aria-label="{{ app.sub.lang.string.container.buttons.search }}">
                                <i class="fas fa-search"></i>
                                <span title="{{ app.sub.lang.string.container.buttons.clear }}"
                                    class="form-control-clear fas fa-times form-control-feedback d-none"></span>
                            </div>
                            <div class="search-results shadow d-none">
                                <span></span>
                                <div class="load-area bg-white pt-5 pb-5 d-block">
                                    <div class="post-loader-spin d-block"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="service-list-area w-100">
                        <form method="post">
                            <div id="servicesAccordion">
                                {% for item in string.addonList %}
                                   <div class="app-addon app-service bg-white shadow-sm position-relative mb-3 rounded" data-name="{{ item.name }}" data-event-id="{{ item.event_id }}" data-order="{{ item.settings.order }}">
                                        <div class="app-post">
                                            <div class="post-layout d-flex align-items-center border-top-0 px-2 p-1 collapse" data-toggle="collapse" data-target="#adminAddons_{{ item.name }}-{{ item.event_id }}"
                                                aria-expanded="true" aria-controls="adminAddons_{{ item.name }}-{{ item.event_id }}">
                                                <div class="post-icon">
                                                    <i class="fas fa-puzzle-piece"></i>
                                                </div>
                                                <div class="head-title d-flex flex-column ml-lg-0 ml-2 mr-auto">
                                                    {% if item.title is defined %}
                                                        <span class="font-weight-bold">{{ item.title }}</span>
                                                    {% else %}
                                                        <span class="font-weight-bold">{{ item.name }}</span>
                                                    {% endif %}
                                                    <small>{{ item.description }}</small>
                                                </div>
                                                {% if not item.settings.perm_id is same as('core-application') %}
                                                    <div class="mr-5" data-ui="addon-switcher">
                                                        <div class="checkbox switcher">
                                                            <label class="mb-0">
                                                                <input type="checkbox" value="1" {{ item.file is same as('noactive') ? '' : 'checked="checked"' }}>
                                                                <span><small></small></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                {% endif %}
                                            </div>
                                        </div>
                                        <div>
                                            <div class="p-2">
                                                <div class="form-group row flex-lg-row flex-column mx-auto">
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label class="col-form-label">{{ app.sub.lang.string.admin.addons.list.addon.id.title }}</label>
                                                        <div>
                                                            <input class="form-control" type="text" value="{{ item.event_id }}" disabled />
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label class="col-form-label">{{ app.sub.lang.string.admin.addons.list.addon.name.title }}</label>
                                                        <div>
                                                            <input class="form-control" type="text" value="{{ item.name }}" disabled />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group row flex-lg-row flex-column mx-auto">
                                                    <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                        <label class="col-form-label">{{ app.sub.lang.string.admin.addons.list.addon.application.title }}</label>
                                                        <div>
                                                            <a href="{{ app.phrase.buildLink('adminAddons', {}) }}?app=[{{ item.application.app }}]">{{ item.application.app }}</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div><a target="_blank" href="{{ item.developers.list.link }}">{{ item.developers.list.name }}</a></div>
                                                <div>v{{ item.version }}</div>
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