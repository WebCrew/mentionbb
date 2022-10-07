{% extends 'container.tpl' %}

{% block app_template_name 'messages' %}

{% block content %}
	<div class="app-profile-sub-menu d-flex flex-column flex-lg-row align-items-lg-center w-100 mb-4">
		<div class="d-flex">
			<div class="app-title">
				<div class="app-breadcrumb d-flex">
					<div class="home"><a href="{{ app.phrase.buildLink('indexAction', {}) }}">{{ app.settings.site_title }}</a></div>
					<div><a href="{{ app.phrase.buildLink('messages', {}) }}">{{ app.sub.lang.string.messages.breadcrumb.messages }}</a></div>
					<div>{{ app.sub.lang.string.messages.breadcrumb.conversations }}</div>
					{% if string.conversation is defined %}
					    <div>{{ string.conversation.title }}</div>
					{% elseif app.request.getPathInfo() == '/messages/new' %}
						<div>{{ app.sub.lang.string.messages.breadcrumb.new }}</div>
					{% elseif app.request.getPathInfo() == '/messages' %}
						<div>{{ app.sub.lang.string.messages.breadcrumb.all }}</div>
					{% endif %}
				</div>
			</div>
		</div>
		<div class="ml-lg-auto">
			{% include 'usermenu_member.tpl' %}
		</div>
	</div>
	<aside class="col-sm-3 mb-4 pr-4">
		<div class="mb-3">
			<button type="button" class="btn btn-app-discussion icon plus" data-ui="send-message" data-text="{{ app.sub.lang.string.messages.breadcrumb.new }}">{{ app.sub.lang.string.discussion.posts.quick_menu.links.message }}</button>
		</div>
		{% import 'macro.messages_list.tpl' as macros %}
		<div class="card app-forums app-search-messages bg-white rounded shadow mb-4">
			<div class="card-header">
				<h6 class="font-weight-bold">{{ app.sub.lang.string.messages.search.title }}</h6>
			</div>
			<article class="card-group-item">
				<div class="filter-content">
					<div class="list-group list-group-flush">
						<div class="p-3">
							<div id="messages-quick-search" class="form-inline my-2 my-lg-0">
								<div class="input-group has-feedback has-clear mb-2">
									<input name="keyword" class="form-control" type="text" placeholder="{{ app.sub.lang.string.messages.search.placeholder }}" aria-label="{{ app.sub.lang.string.messages.search.title }}">
									<span title="{{ app.sub.lang.string.container.buttons.clear }}" class="form-control-clear fas fa-times form-control-feedback d-none"></span>
									<div class="input-group-append">
										<button class="btn btn-app-search icon search no-anim-ui" aria-label="{{ app.sub.lang.string.container.buttons.search }}" type="button"></button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</article>
		</div>
		<div class="card app-forums app-list-messages bg-white rounded shadow mb-4">
			<div class="card-header">
				<h6 class="font-weight-bold">{{ app.sub.lang.string.messages.conversation.title }}</h6>
			</div>
			<article class="card-group-item">
				<div class="filter-content">
					<div class="list-group list-group-flush scrollable">
						{{ macros.messages(item, 0) }}
						<div class="new d-none"></div>
					</div>
				</div>
			</article>
		</div>
		<div class="card app-forums app-archived-messages bg-white rounded shadow mb-4">
			<div class="card-header">
				<h6 class="font-weight-bold">{{ app.sub.lang.string.messages.conversation.archived }}</h6>
			</div>
			<article class="card-group-item">
				<div class="filter-content">
					<div class="list-group list-group-flush scrollable">
						{{ macros.messages(item, 1) }}
						<div class="new d-none"></div>
					</div>
				</div>
			</article>
		</div>
	</aside>
	<aside class="col-sm-9">
		<div class="app-tab-container">
			<div class="no-post d-block">
			    <span>{{ app.sub.lang.string.container.no_post.none }}</span>
			    <p data-ui="send-message">{{ app.sub.lang.string.messages.conversation.default }}</p>
		    </div>
		    <div class="conversation-area show"></div>
		    <div class="post-loader-spin"></div>
		</div>
	</aside>
	{# This is includes meta definitions. #}
	<div hook-action="{Mention:App-domEvent-metacontents}"
		data-title="{{ string.conversation.title ? string.conversation.title : app.sub.lang.string.messages.title }}"
		data-meta-description="{{ app.settings.meta_description }}"
		data-og-description="{{ app.settings.meta_description }}"
		data-twitter-description="{{ app.settings.meta_description }}" data-og-title="{{ app.settings.meta_description }}"
		data-twitter-title="{{ app.settings.meta_description }}" class="d-none">
	</div>
{% endblock %}