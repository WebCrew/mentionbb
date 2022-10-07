{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/theme/editor' %}

{% block title %}{{ app.sub.lang.string.admin.theme.editor.title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminTheme', {}) }}">{{ app.sub.lang.string.admin.theme.editor.title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
    {% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="theme">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3 pb-3">
				<div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.string.admin.theme.editor.title }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.theme.editor.desc }}</small>
                    </div>
                </div>
                <div class="d-flex flex-column align-items-center justify-content-center mt-3">
                    <div class="align-self-start col-lg-6 col-sm-12 mb-3">
                        <div class="app-admin-style-selector js-AppAdmin_ThemeStyleSelector position-relative">
                            <select class="selectpicker ml-lg-auto pt-2 pt-lg-0" data-live-search="true" title="{{ app.sub.lang.string.container.buttons.select }}">
                                {% for item in string.theme.getCss() %}
                                    <option value="{{ item.name }}" {{ item.name is same as('core.css') ? 'selected' : '' }}>{{ item.name }}</option>
                                {% endfor %}
                            </select>
                        </div>
                    </div>
                    <div class="service-list-area w-100">
                        <form id="admin_theme_editor" method="post">
                            <div id="servicesAccordion">
                                <div class="app-style-editor app-service bg-white shadow-sm position-relative mb-3 rounded">
                                    <div class="app-post">
                                        <div class="post-layout d-flex align-items-center border-top-0 px-2 p-1 collapse">
                                            <div class="post-icon">
                                                <i class="fas fa-palette"></i>
                                            </div>
                                            <div class="head-title d-flex flex-column ml-lg-0 ml-2 mr-auto">
                                                <span class="font-weight-bold">core.css</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="scrollable">
                                        <div class="content d-none">{{ string.theme.getCssFile('core.css') }}</div>
                                        <div id="editor"></div>
                                    </div>
                                </div>   
                            </div>
                            <div class="w-100 d-inline-block">
								<div class="sticky-button is-sticky shadow">
                                    <div class="progress d-none">
				                        <div class="indeterminate"></div>
			                        </div>
									<button type="submit" class="btn btn-app-discussion no-anim-ui icon send">{{ app.sub.lang.string.container.buttons.update }}</button>
								</div>
							</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </aside>
{% endblock %}