{% extends 'container.tpl' %}

{% block app_template_name 'index' %}

{% block content %}
	<div class="col-sm-12 title-mobile">
		<h5 class="app-title mobile">{{ app.settings.site_title }}</h5>
	</div>
	<aside class="col-sm-3 app-forums-area mb-4 pr-4 order-2 order-lg-1 sticky">
		<h5 class="app-title">{{ app.settings.site_title }}</h5>
		<div class="d-lg-block d-none">
			<div class="card app-forums bg-white rounded shadow mt-2 mb-4">
				<div class="card-header">
					<h6 class="font-weight-bold">{{ app.sub.lang.string.index.forums.title }}</h6>
				</div>
				<article class="card-group-item">
					<div class="filter-content">
						<div class="list-group list-group-flush scrollable">
							{% if not app.user.loggedIn() %}
								<div class="d-none" data-no-refresh="true"></div>
							{% endif %}
							<a href="#" data-forum-id="0" data-ui="quick-forum-posts" class="list-group-item active">{{ app.sub.lang.string.index.forums.news }}<span class="float-right badge badge-dark round">{{ string.post.getForumPostCount() }}</span>  </a>
							{% for item in app.string.forum.getForumList() %}
								{{ string.post.setForumId(item.forum_id) }}
								<a href="{{ app.phrase.buildLink('forum', {'forum_id': item.forum_id, 'title': item.title}) }}" data-forum-id="{{ item.forum_id }}" data-ui="quick-forum-posts" class="list-group-item">{{ item.title }} <span class="float-right badge badge-dark round">{{ string.post.getForumPostCount() }}</span>  </a>
								{{ string.post.unsetForumId() }}
								{% for sub in app.string.forum.getForumList(item.forum_id) %}
									{{ string.post.setForumId(sub.forum_id) }}
									<a href="{{ app.phrase.buildLink('forum', {'forum_id': sub.forum_id, 'title': sub.title}) }}" data-forum-id="{{ sub.forum_id }}" data-ui="quick-forum-posts" class="sub list-group-item">-- {{ sub.title }} <span class="float-right badge badge-dark round">{{ string.post.getForumPostCount() }}</span>  </a>
									{{ string.post.unsetForumId() }}
								{% endfor %}
							{% endfor %}
						</div>
					</div>
				</article>
			</div>
			<div class="card app-forums app-search bg-white rounded shadow mb-4">
				<article class="card-group-item">
					<div class="p-3">
						<div id="quick-search" class="form-inline my-2 my-lg-0">
							<div class="input-group has-feedback has-clear mb-2">
								<input name="keyword" class="form-control" type="text" placeholder="{{ app.sub.lang.string.index.search.placeholder }}" aria-label="{{ app.sub.lang.string.container.buttons.search }}" aria-id="indexForumSearch">
								<span title="{{ app.sub.lang.string.container.buttons.clear }}" class="form-control-clear fas fa-times form-control-feedback d-none"></span>
								<div class="input-group-append">
									<button class="btn btn-app-search icon search no-anim-ui" aria-label="{{ app.sub.lang.string.container.buttons.search }}" type="button"></button>
								</div>
							</div>
							<div class="form-check mb-0">
								<input name="search-forum" type="checkbox" class="form-check-input" id="searchForum" checked="checked">
								<label class="form-check-label" for="searchForum">{{ app.sub.lang.string.container.search.search_forums }}</label>
							</div>
						</div>
						<!-- <a class="text-dark" href="{{ app.phrase.buildLink('search', {}) }}">{{ app.sub.lang.string.container.search.advanced_search }}</a> -->
					</div>
				</article>
			</div>
		</div>
		<div class="card app-forums app-stats bg-white rounded shadow">
			<div class="card-header">
				<h6 class="font-weight-bold">{{ app.sub.lang.string.index.stats.title }}</h6>
			</div>
			<article class="card-group-item">
				<div class="list-group list-group-flush">
					<div class="list-group-item icon discussions">{{ app.sub.lang.string.index.stats.discussion_count }}
						<span class="float-right badge badge-dark round">{{ string.discussion.postCount()|number_format|numberFormatShorter }}</span> 
					</div>
					<div class="list-group-item icon posts">{{ app.sub.lang.string.index.stats.total_posts }}
						<span class="float-right badge badge-dark round">{{ string.post.getForumPostCount()|number_format|numberFormatShorter }}</span> 
					</div>
					<div class="list-group-item icon users">{{ app.sub.lang.string.index.stats.user_count }}
						<span class="float-right badge badge-dark round">{{ string.stats.getUserCount()|number_format|numberFormatShorter }}</span> 
					</div>
					<div class="list-group-item icon last-user">{{ app.sub.lang.string.index.stats.last_registered_user }}
						{% set lastRegisterUser = string.stats.getLastRegistered() %}
						<span class="float-right">
							{{ app.sub.user.link.setUser(lastRegisterUser.user_id) }}
							{% autoescape false %}
								<a class="text-dark font-weight-bold user-tooltip-link" href="{{ app.sub.user.link.getOnlyLink() }}" data-user-id="{{ app.sub.user.link.getId() }}">{{ app.sub.user.link.getName() }}</a>
							{% endautoescape %}
							{{ app.sub.user.link.unsetUser() }}
						</span>
					</div> 
				</div>
			</article>
		</div>
	</aside>
	<aside class="col-sm-9 app-discussions-area order-1 order-lg-2">
		<div class="app-post-manage d-flex flex-column flex-lg-row mb-3">
			<div class="order-2 order-lg-1 d-flex flex-row">
				<div class="app-order-post dropdown">
					<button class="btn btn-app-dd no-anim-ui icon order-newest dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" aria-id="indexSelectOrder">{{ app.sub.lang.string.container.order.new_message }}</button>
					<div class="dropdown-menu dropdown-menu-left custom-menu custom-menu-md shadow animate slideIn" aria-labelledby="dropdownMenuButton">
						<div class="title">
							<div>
								<span>{{ app.sub.lang.string.container.order.title }}</span>
							</div>
						</div>
						<div>
							<a class="notification quick-menu d-flex active" data-ui="order-index-posts" data-order="newest" href="{{ app.phrase.buildLink('indexAction', {'tab': 'newest'}) }}">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.new_message }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-index-posts" data-order="popular" href="{{ app.phrase.buildLink('indexAction', {'tab': 'popular'}) }}">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.popular }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-index-posts" data-order="top-likes" href="{{ app.phrase.buildLink('indexAction', {'tab': 'top-likes'}) }}">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.top_likes }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-index-posts" data-order="oldest" href="{{ app.phrase.buildLink('indexAction', {'tab': 'oldest'}) }}">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.oldest }}</span>
								</div>
							</a>
						</div>
					</div>
				</div>
				<button class="post-refresh ml-4" data-ui="post-refresher" aria-label="{{ app.sub.lang.string.container.buttons.refresh }}"></button>
				<div class="d-flex flex-column align-self-center ml-4">
					<label class="app-switch switch active">
						<input type="checkbox" checked="checked">
						<span class="slider"></span>
					</label>
					<small class="text-dark font-weight-bold">{{ app.sub.lang.string.index.auto_refresher }}</small>
				</div>
			</div>
			<div class="order-1 order-lg-2 ml-lg-auto mb-3 mb-lg-0">
				{% include 'usermenu_member.tpl' %}
			</div>
		</div>
		{% if not app.user.loggedIn() %}
		    {% include 'guest_welcome.tpl' %}
		{% endif %}
		{% import 'macro.editor.tpl' as editor %}
		{{ editor.editor('app-create-post', true) }}
		<div class="app-forums-mobile mb-4 d-lg-none d-block">
			<small class="text-muted">{{ app.sub.lang.string.index.responsive_mode }}</small>
			<div class="post-loader-spin"></div>
		</div>
		<div class="app-post-container animate slideIn">
			{% include 'index_posts.tpl' %}
		</div>
		<div class="post-loader-spin"></div>
	</aside>
{% endblock %}