{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/settings' %}

{% block title %}{{ app.sub.lang.string.admin.settings.title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminSiteSettings', {}) }}">{{ app.sub.lang.string.admin.settings.title }}</a></div>
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
			<div class="pl-4 pr-4 pt-3 pb-3">
				<h5 class="mb-3">{{ app.sub.lang.string.admin.settings.title }}</h5>
                <div class="d-flex flex-column align-items-center justify-content-center">
                    {% for item in string.settings.getSettingGroups() %}
                        <div class="setting-group bg-white text-dark d-flex align-items-center shadow-sm rounded">
                            <span class="icon {{ item.group_name }}"></span>
                            <div class="title mr-auto">
                                <h5>{{ app.sub.lang.string.admin.settings.groups[item.group_name].title }}</h5>
                                <small>{{ app.sub.lang.string.admin.settings.groups[item.group_name].desc }}</small>
                            </div> 
                            <a href="{{ app.phrase.buildLink('adminSiteSettings', {}) }}?{{ item.group_name }}"></a>
                        </div>
                    {% endfor %}
                </div>
            </div>
        </div>
    </aside>
{% endblock %}
