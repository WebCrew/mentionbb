{% import 'macro.account_posts.tpl' as macros %}

{% if string.pagination is defined %}
	{% set page_id = string.current_page %}
	{% set wherePage = string.pagination.where %}
{% else %}
	{% set page_id = 1 %}
	{% set wherePage = 0 %}
{% endif %}

{% for item in string.post.getUserLikesPosts(app.visitor.user_id, wherePage, app.settings.per_page) %}
	{{ macros.posts(item, string, 'likes') }}
{% else %}
	{% if not string.keyword is defined %}
	    {% if app.user.loggedIn() %}
		    <div class="no-post d-block">
			    <span>{{ app.sub.lang.string.container.no_post.none }}</span>
		    </div>
	    {% else %}
		    <div class="no-post d-block">
			    <span>{{ app.sub.lang.string.container.no_post.none }}</span>
		    </div>
	    {% endif %}
	{% else %}
		<div class="no-post d-block">
			<span>{{ app.sub.lang.string.container.search.no_results }}</span>
		</div>
    {% endif %}
{% endfor %}
{% if page_id == string.post.getUserLikesLastPage(app.visitor.user_id) %}
{% else %}
	<div class="text-center">
		<button type="button" class="btn btn-app-load-more mb-3" data-current-page="{{ page_id }}" data-next-id="{{ app.sub.post.pagination.encodePageData(app.settings.per_page, (page_id + 1)) }}" data-ui="load-more-user-likes-posts">{{ app.sub.lang.string.container.buttons.more }}</button>
	</div>
{% endif %}