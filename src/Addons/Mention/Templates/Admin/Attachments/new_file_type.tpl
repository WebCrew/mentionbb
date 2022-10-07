{% extends '@ComponentBundle_Admin/container.tpl' %}

{% block app_template_name '@ComponentBundle/admin/attachments/file_types/new' %}

{% block title %}{{ app.sub.lang.string.admin.attachments.file_types.new.title }}{{ " - " }}{{ app.settings.site_title }}{% endblock %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminIndex', {}) }}">{{ app.sub.lang.string.admin.container.title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('adminAttachments', {}) }}?types">{{ app.sub.lang.string.admin.attachments.file_types.title }}</a></div>
                    <div><a href="{{ app.phrase.buildLink('adminAttachments', {}) }}?createFileType">{{ app.sub.lang.string.admin.attachments.file_types.new.title }}</a></div>
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	{% include '@ComponentBundle_Admin/Layout/sidebar.tpl' %}
	
	<aside class="col-sm-9">
		<div class="app-box shadow rounded" data-tab="attachments.new_file_type">
			<div class="progress d-none">
				<div class="indeterminate"></div>
			</div>
			<div class="pl-4 pr-4 pt-3 pb-3">
				<div class="d-lg-flex align-items-lg-center">
                    <div>
                        <h5 class="mb-0">{{ app.sub.lang.string.admin.attachments.file_types.new.title }}</h5>
                        <small class="text-muted">{{ app.sub.lang.string.admin.attachments.file_types.new.desc }}</small>
                    </div>
                    <div class="ml-auto mt-lg-0 mt-3">
                        <a href="{{ app.phrase.buildLink('adminAttachments', {}) }}?types" class="btn btn-app-discussion icon back">{{ app.sub.lang.string.container.buttons.back }}</a>
                    </div>
                </div>  
                <div class="d-flex flex-column align-items-center justify-content-center mt-3">
                    <div class="service-list-area w-100">
                        <form id="admin_attchfiletypes_new" method="post">
                            <div id="servicesAccordion">
                                <div class="app-attachment-filetypes app-service bg-white shadow-sm position-relative mb-3 rounded">
                                    <div class="app-post">
                                        <div class="post-layout d-flex align-items-center border-top-0 px-2 p-1">
                                            <div class="post-icon new">
                                                <i class="fas fa-plus"></i>
                                            </div>
                                            <div class="title ml-lg-0 ml-2 mr-auto">
                                                <span class="font-weight-bold">{{ app.sub.lang.string.admin.attachments.file_types.new.title }}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="p-2">
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_mimetype" class="col-form-label">{{ app.sub.lang.string.admin.attachments.file_types.forms.mime_type.title }}</label>
                                                    <div>
                                                        <input class="form-control" name="options[mime_type]" id="static_mimetype" type="text" placeholder="{{ app.sub.lang.string.admin.attachments.file_types.forms.mime_type.placeholder }}" aria-describedby="help_mimetype" spellcheck="false" required="required">
                                                        <small id="help_mimetype" class="form-text text-muted">{{ app.sub.lang.string.admin.attachments.file_types.forms.mime_type.text|raw }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12">
                                                    <label for="static_title" class="col-form-label">{{ app.sub.lang.string.admin.attachments.file_types.forms.name.title }}</label>
                                                    <div>
                                                        <input class="form-control" name="options[extension]" id="static_title" type="text" placeholder="{{ app.sub.lang.string.admin.attachments.file_types.forms.name.placeholder }}" aria-describedby="help_title" spellcheck="false" required="required">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group row flex-lg-row flex-column mx-auto">
                                                <div class="col-lg-6 col-sm-12 pr-lg-5">
                                                    <label for="static_icon" class="col-form-label">{{ app.sub.lang.string.admin.attachments.file_types.forms.icon.title }}</label>
                                                    <div>
                                                        <input class="form-control" name="options[icon]" id="static_icon" type="text" placeholder="{{ app.sub.lang.string.admin.attachments.file_types.forms.icon.placeholder }}" aria-describedby="help_icon" spellcheck="false">
                                                        <small id="help_icon" class="form-text text-muted">{{ app.sub.lang.string.admin.attachments.file_types.forms.icon.text|raw }}</small>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6 col-sm-12 mt-2 mt-lg-0">
                                                    <label for="static_is_active" class="col-form-label">{{ app.sub.lang.string.admin.attachments.file_types.forms.status.title }}</label>
                                                    <div class="checkbox switcher">
                                                        <label for="help_is_active">
                                                            <input type="checkbox" name="options[is_active]" id="help_is_active" value="1" checked>
                                                            <span><small></small></span>
                                                            <small id="help_is_active" class="text-muted">{{ app.sub.lang.string.admin.attachments.file_types.forms.status.title }}</small>
                                                            <small id="help_is_active" class="form-text text-muted">{{ app.sub.lang.string.admin.attachments.file_types.forms.status.text }}</small>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <button type="submit" class="btn btn-app-discussion no-anim-ui icon plus">{{ app.sub.lang.string.container.buttons.save }}</button>
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