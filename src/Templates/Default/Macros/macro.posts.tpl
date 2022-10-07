{% macro posts(item, loop, firstpost = false, string = false) %}
	{% if firstpost %}
		<div hook-action="{Mention:App-domEvent-discussionfirstpost}" class="post first-post" data-date="{{ app.timer.date.getFullDate(string.discussion.dateline) }}" data-item="1" data-post-id="{{ item.post_id }}" data-discussion-id="{{ item.discussion_id }}" data-forum-id="{{ item.forum_id }}" data-user-id="{{ item.user_id }}" data-post-count="{{ string.post.getDiscussionPostCount() }}" data-last-post-id="{{ string.post.getDiscussionLastPost() }}" data-shortcode="{{ app.sub.discussion.shortcode.toBase(item.shortcode) }}">
	{% else %}
	    <div hook-action="{Mention:App-domEvent-discussionposts}" class="post" data-date="{{ app.timer.date.getFullDate(item.dateline) }}" data-item="" data-post-id="{{ item.post_id }}" data-user-id="{{ item.user_id }}" data-shortcode="{{ app.sub.discussion.shortcode.toBase(item.shortcode) }}">
	{% endif %}
	<div class="app-post app-discussion bg-white shadow rounded">
		<div class="progress d-none">
			<div class="indeterminate"></div>
		</div>
		<div class="post-layout mt-2 mb-3">
			<div class="post-user">
				{{ app.sub.user.link.setUser(item.user_id) }}
				{% autoescape 'html' %}
					{{ app.sub.user.link.getLinkWithProfilePicture()|raw }}
				{% endautoescape %}
				<div class="discussion-post-user">
					{{ app.sub.user.link.getLink()|raw }}
					{% if app.sub.user.link.isAdmin() %}
					    <span class="d-block">{{ app.sub.user.link.getUsertitle()|raw }}</span>
					{% else %}
					    <span class="d-block">{{ app.sub.user.link.getUsertitle()|striptags }}</span>
					{% endif %}
				</div>
				{{ app.sub.user.link.unsetUser() }}
			</div>
			<div class="post-content">
				<div class="discussion-post-user">
					<div class="dropdown">
						<a class="text-dark dropdown-toggle" role="button" id="dropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ item.username }}</a>
						<div class="dropdown-menu custom-menu post-user-menu animate slideIn shadow p-0" aria-labelledby="dropdownMenuButton">
							<div class="title">
								<div>
									<span>{{ app.sub.lang.string.container.quick_menu }}</span>
								</div>
								{% if app.visitor.is_admin %}
									<div>
										<a title="{{ app.sub.lang.string.discussion.posts.quick_menu.buttons.edit }}" href="{{ app.phrase.buildLink('adminUsers', {}) }}?editUser={{ item.user_id }}">
											<i class="fas fa-user-edit"></i>
										</a>
										<a title="{{ app.sub.lang.string.discussion.posts.quick_menu.buttons.flag }}" href="{{ app.phrase.buildLink('adminUsers', {}) }}?flagUser={{ item.user_id }}">
											<i class="fas fa-exclamation-triangle"></i>
										</a>
										<a title="{{ app.sub.lang.string.discussion.posts.quick_menu.buttons.ban }}" href="{{ app.phrase.buildLink('adminUsers', {}) }}?banUser={{ item.user_id }}">
											<i class="fas fa-user-slash"></i>
										</a>
									</div>
								{% endif %}
							</div>
							<div class="scrollable">
								{% if app.user.loggedIn() %}
									{% if not item.user_id is same as(app.visitor.user_id) %}
										{% if app.string.profile.isUserHasFriendship(app.visitor.user_id, item.user_id, 1) %}
											<a class="notification quick-menu d-flex" data-ui="quick-remove-friend" data-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.add_as_friend }}" data-complete-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.request_send_friend }}" href="#">
												<div class="text ml-3">
													<span class="icon add-friend">{{ app.sub.lang.string.discussion.posts.quick_menu.links.request_send_friend }}</span>
												</div>
											</a>
										{% elseif app.string.profile.isUserHasFriendship(app.visitor.user_id, item.user_id, 0) %}
											<a class="notification quick-menu d-flex" data-ui="quick-add-as-friend" data-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.add_as_friend }}" data-complete-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.request_send_friend }}" href="#">
												<div class="text ml-3">
													<span class="icon add-friend">{{ app.sub.lang.string.discussion.posts.quick_menu.links.remove_from_list }}</span>
												</div>
											</a>
										{% else %}
											<a class="notification quick-menu d-flex" data-ui="quick-add-as-friend" data-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.add_as_friend }}" data-complete-text="{{ app.sub.lang.string.discussion.posts.quick_menu.links.request_send_friend }}" href="#">
												<div class="text ml-3">
													<span class="icon add-friend">{{ app.sub.lang.string.discussion.posts.quick_menu.links.add_as_friend }}</span>
												</div>
											</a>
										{% endif %}
									{% endif %}
								{% endif %}
								<a class="notification quick-menu d-flex" href="{{ app.phrase.buildLink('profile', {'username': item.username, 'user_id': item.user_id}) }}">
									<div class="text ml-3">
										<span class="icon user">{{ app.sub.lang.string.discussion.posts.quick_menu.links.profile }}</span>
									</div>
								</a>
								<a class="notification quick-menu d-flex" href="{{ app.phrase.buildLink('profile', {'username': item.username, 'user_id': item.user_id, 'tab': 'posts'}) }}">
									<div class="text ml-3">
										<span class="icon post">{{ app.sub.lang.string.discussion.posts.quick_menu.links.posts }}</span>
									</div>
								</a>
								{% if app.user.loggedIn() %}
									<a class="notification quick-menu d-flex" href="{{ app.phrase.buildLink('messages', {'section': 'new', 'id': item.user_id}) }}">
										<div class="text ml-3">
											<span class="icon message">{{ app.sub.lang.string.discussion.posts.quick_menu.links.message }}</span>
										</div>
									</a>
								{% endif %}
							</div>
							<div class="extra-button pt-2 pb-2 text-center"></div>
						</div>
					</div>
					{{ app.sub.user.link.setUser(item.user_id) }}
					    {% if app.sub.user.link.isAdmin() %}
					        <span class="d-block">{{ app.sub.user.link.getUsertitle()|raw }}</span>
					    {% else %}
					    	<span class="d-block">{{ app.sub.user.link.getUsertitle()|striptags }}</span>
					    {% endif %}
					{{ app.sub.user.link.unsetUser() }}
				</div>
				<div class="post-control d-flex align-items-center">
					<span class="text-muted mr-3">{{ app.timer.date.toHumanReadable(item.dateline) }}</span>
					<div class="dropdown">
						<a title="{{ app.sub.lang.string.discussion.posts.message_options.title }}" class="text-dark dropdown-toggle" role="button" id="dropdownMenuLink" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></a>
						<div class="dropdown-menu dropdown-menu-right custom-menu post-user-menu animate slideIn shadow p-0" aria-labelledby="dropdownMenuButton">
							<div class="title">
								<div>
									<span>{{ app.sub.lang.string.discussion.posts.message_options.title }}</span>
								</div>
							</div>
							<div class="scrollable">
								{% if app.user.loggedIn() %}
									{% if string.post.isUserBookmarkPost(item.post_id, app.visitor.user_id) %}
										<a class="notification quick-menu d-flex" data-ui="post-bookmark-undo" data-text="{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark }}" data-toggle-text="{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark_saved }}" href="#">
											<div class="text ml-3">
												<span class="icon bookmark active">{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark_saved }}</span>
											</div>
										</a>
									{% else %}
										<a class="notification quick-menu d-flex" data-ui="post-bookmark" data-text="{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark }}" data-toggle-text="{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark_saved }}" href="#">
											<div class="text ml-3">
												<span class="icon bookmark">{{ app.sub.lang.string.discussion.posts.message_options.links.bookmark }}</span>
											</div>
										</a>
									{% endif %}
									{% if not firstpost %}
										<a class="notification quick-menu d-flex" data-ui="mark-as-helpful" href="#">
											<div class="text ml-3">
												<span class="icon check">{{ app.sub.lang.string.discussion.posts.message_options.links.mark_helpful }}</span>
											</div>
										</a>
									{% endif %}
									<a class="notification quick-menu d-flex d-md-none" data-ui="report-post" href="#">
										<div class="text ml-3">
											<span class="icon report">{{ app.sub.lang.string.discussion.posts.buttons.report }}</span>
										</div>
									</a>
									{% if item.user_id is same as(app.visitor.user_id) or app.visitor.is_admin %}
										{% if firstpost %}
											{% if app.visitor.is_admin %}
												<div class="inner-head">{{ app.sub.lang.string.discussion.posts.message_options.moderation }}</div>
												<a class="notification quick-menu d-flex" data-ui="move-discussion" href="#">
													<div class="text ml-3">
														<span class="icon move">{{ app.sub.lang.string.discussion.posts.message_options.links.move }}</span>
													</div>
												</a>
												{% if item.is_sticky %}
													<a class="notification quick-menu d-flex" data-ui="un-pin-discussion" href="#">
														<div class="text ml-3">
															<span class="icon pin active">{{ app.sub.lang.string.discussion.posts.message_options.links.pinned }}</span>
														</div>
													</a>
												{% else %}
													<a class="notification quick-menu d-flex" data-ui="pin-discussion" href="#">
														<div class="text ml-3">
															<span class="icon pin">{{ app.sub.lang.string.discussion.posts.message_options.links.pin }}</span>

														</div>
													</a>
												{% endif %}
												{% if item.is_open %}
													<a class="notification quick-menu d-flex" data-ui="lock-discussion" href="#">
														<div class="text ml-3">
															<span class="icon lock">{{ app.sub.lang.string.discussion.posts.message_options.links.lock }}</span>
														</div>
													</a>
												{% else %}
													<a class="notification quick-menu d-flex" data-ui="open-discussion" href="#">
														<div class="text ml-3">
															<span class="icon open-lock active">{{ app.sub.lang.string.discussion.posts.message_options.links.locked }}</span>
														</div>
													</a>
												{% endif %}
											{% endif %}
										{% endif %}
										<div class="inner-head d-lg-none">{{ app.sub.lang.string.discussion.posts.message_options.message_moderation }}</div>
										<a class="notification quick-menu d-flex d-lg-none" data-ui="edit-post" href="#">
											<div class="text ml-3">
												<span class="icon edit">{{ app.sub.lang.string.discussion.posts.buttons.edit }}</span>
											</div>
										</a>
										<a class="notification quick-menu d-flex d-lg-none" data-ui="delete-post" href="#">
											<div class="text ml-3">
												<span class="icon trash">{{ app.sub.lang.string.discussion.posts.buttons.delete }}</span>
											</div>
										</a>
									{% endif %}
								{% endif %}
								<div class="inner-head">{{ app.sub.lang.string.discussion.posts.message_options.more }}</div>
								<a href="{{ app.phrase.buildLink('shortcode', {'shortcode': app.sub.discussion.shortcode.toBase(item.shortcode)}, true) }}" data-ui="copy-link" class="notification quick-menu d-flex" data-complete="0" data-complete-text="{{ app.sub.lang.string.discussion.posts.message_options.links.copy_link_success }}">
									<div class="text ml-3">
										<span class="icon copy">{{ app.sub.lang.string.discussion.posts.message_options.links.copy_link }}</span>
									</div>
								</a>
								{% if firstpost %}
									<a class="notification quick-menu d-flex" data-ui="share" href="#">
										<div class="text ml-3">
											<span class="icon share">{{ app.sub.lang.string.discussion.posts.buttons.share }}</span>
										</div>
									</a>
								{% endif %}
							</div>
							<div class="extra-button pt-2 pb-2 text-center"></div>
						</div>
					</div>
				</div>
				<hr>
				<div hook-action="{Mention:App-domEvent-discussionpost-text}" class="discussion-text">
					{% if firstpost %}
					    <article class="discussion-body app-bbcode-content">
					        {% autoescape false %}
						        {{ app.sub.renderer.bbcode.Parse(item.content)|raw }}
					        {% endautoescape %}
						</article>
					{% else %}
					    {% autoescape false %}
					        {{ app.sub.renderer.bbcode.Parse(item.content)|raw }}
				        {% endautoescape %}
					{% endif %}
				</div>
				<div class="post-attachment-area">
				    {% include 'updateAttachments.tpl' %}
				</div>
				<div class="post-append d-flex flex-lg-row flex-column align-items-baseline">
				    {% include 'updateLike.tpl' %}
				    {% if item.lastedit_userid > 0 %}
					    <div class="post-edit align-items-baseline order-2 mt-4 ml-lg-auto">
						    {{ app.sub.user.link.setUser(item.lastedit_userid) }}
						    <span>{{ app.sub.lang.parse.Parse('discussion.posts.edit.text', app.sub.user.link.getLink()|raw, app.timer.date.toHumanReadable(item.lastedit_date))|raw }}</span>
						    {{ app.sub.user.link.unsetUser() }}
					    </div>
				    {% endif %}
			    </div>
				<hr>
				<div class="discussion-manage mb-2 d-flex">
					<div class="discuss-info d-none d-md-flex">
						{% if app.user.loggedIn() %}
						    <div>
							    <a data-ui="report-post" class="report-button" href="#">{{ app.sub.lang.string.discussion.posts.buttons.report }}</a>
						    </div>
						    {% if item.user_id is same as(app.visitor.user_id) or app.visitor.is_admin %}
						    	<div>
						    		<a data-ui="delete-post" class="delete-button" href="#">{{ app.sub.lang.string.discussion.posts.buttons.delete }}</a>
						    	</div>
						    	<div>
						    		<a data-ui="edit-post" class="edit-button" href="#">{{ app.sub.lang.string.discussion.posts.buttons.edit }}</a>
						    	</div>
						    {% endif %}
					    {% endif %}
					</div>
					<div class="discuss-info d-flex ml-lg-auto ml-sm-0">
						{% if app.user.loggedIn() %}
						    <div>
							    {% if string.post.isUserLikePost(item.post_id, app.visitor.user_id) %}
							    	{% set reaction = string.post.isUserLikePost(item.post_id, app.visitor.user_id).reaction %}
							        <a class="like-button d-flex align-items-center reaction {{ reaction }}" data-ui="take-like-post" data-text="{{ app.sub.lang.string.discussion.posts.buttons.like }}" data-toggle-text="{{ app.sub.lang.string.discussion.posts.buttons.take_like }}" href="#">
							        	{% if reaction is same as('like') %}
										    <span>{{ app.sub.lang.string.discussion.posts.buttons.take_like }}</span>
										{% else %}
										    <span>{{ app.sub.lang.string.discussion.posts.reaction[reaction] }}</span>
										{% endif %}
							        	<div class="reaction-box shadow d-none">
								    		<div class="reaction-icon like" data-ui="like-post" data-reaction="like">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.like }}</label>
								    		</div>
								    		<div class="reaction-icon love" data-ui="like-post" data-reaction="love">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.love }}</label>
								    		</div>
								    		<div class="reaction-icon haha" data-ui="like-post" data-reaction="haha">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.haha }}</label>
								    		</div>
								    		<div class="reaction-icon wow" data-ui="like-post" data-reaction="wow">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.wow }}</label>
								    		</div>
								    		<div class="reaction-icon sad" data-ui="like-post" data-reaction="sad">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.sad }}</label>
								    		</div>
								    		<div class="reaction-icon angry" data-ui="like-post" data-reaction="angry">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.angry }}</label>
								    		</div>
											<div class="reaction-icon dislike" data-ui="like-post" data-reaction="dislike">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.dislike }}</label>
								    		</div>
								    	</div>
								    </a>
							    {% else %}
								    <a role="button" class="like-button d-flex align-items-center" data-ui="like-post" data-text="{{ app.sub.lang.string.discussion.posts.buttons.like }}" data-toggle-text="{{ app.sub.lang.string.discussion.posts.buttons.take_like }}">
								    	<span>{{ app.sub.lang.string.discussion.posts.buttons.like }}</span>
								    	<div class="reaction-box shadow">
								    		<div class="reaction-icon like" data-ui="like-post" data-reaction="like">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.like }}</label>
								    		</div>
								    		<div class="reaction-icon love" data-ui="like-post" data-reaction="love">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.love }}</label>
								    		</div>
								    		<div class="reaction-icon haha" data-ui="like-post" data-reaction="haha">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.haha }}</label>
								    		</div>
								    		<div class="reaction-icon wow" data-ui="like-post" data-reaction="wow">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.wow }}</label>
								    		</div>
								    		<div class="reaction-icon sad" data-ui="like-post" data-reaction="sad">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.sad }}</label>
								    		</div>
								    		<div class="reaction-icon angry" data-ui="like-post" data-reaction="angry">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.angry }}</label>
								    		</div>
											<div class="reaction-icon dislike" data-ui="like-post" data-reaction="dislike">
								    			<label>{{ app.sub.lang.string.discussion.posts.reaction.dislike }}</label>
								    		</div>
								    	</div>
								    </a>
							    {% endif %}
						    </div>
							{% if string.discussion.is_open %}
						        <div>
							        <a data-ui="post-quote" class="quote-button" href="#">{{ app.sub.lang.string.discussion.posts.buttons.reply }}</a>
						        </div>
							{% else %}
							    <div>
								    <div title="{{ app.sub.lang.string.discussion.posts.buttons.grey_button }}" class="grey-button toggle-tooltip"></div>
							    </div>
							{% endif %}
						{% else %}
							<div>
								<a data-ui="login-attempt" class="like-button" href="#">{{ app.sub.lang.string.discussion.posts.buttons.like }}</a>
							</div>
						{% endif %}
						{% if firstpost %}
							<div>
								<a data-ui="share" class="share-button" href="#" role="button">{{ app.sub.lang.string.discussion.posts.buttons.share }}</a>
							</div>
						{% endif %}
					</div>
					<div class="d-none reaction-popover-container" data-title="Paylaş">
						<div class="d-flex reaction-content">
							<div>
								<a class="icon like" data-ui="like-post" data-reaction="like" href="#"></a>
							</div>
						</div>
					</div>
					{% if firstpost %}
						<div class="d-none share-popover-container" data-title="Paylaş">
							<div class="d-flex share-content">
								<div>
									<a title="Facebook" class="app-share-button icon facebook" href="https://www.facebook.com/sharer.php?u={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}"></a>
								</div>
								<div>
									<a title="Twitter" class="app-share-button icon twitter" href="https://twitter.com/intent/tweet?url={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}"></a>
								</div>
								<div>
									<a title="Reddit" class="app-share-button icon reddit" href="https://reddit.com/submit?url={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}"></a>
								</div>
								<div>
									<a title="Pinterest" class="app-share-button icon pinterest" href="https://pinterest.com/pin/create/bookmarklet/?url={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}"></a>
								</div>
								<div>
									<a title="WhatsApp" class="app-share-button icon whatsapp" href="https://api.whatsapp.com/send?text={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}"></a>
								</div>
								<div>
									<a title="Telegram" class="app-share-button icon telegram" href="https://t.me/share/url?url={{ app.settings.site_url }}/d/{{ item.discussion_id }}-{{ item.title|buildSeoLink }}&text={{ item.title }}"></a>
								</div>
							</div>
						</div>
					{% endif %}
				</div>
			</div>
		</div>
	</div>
	<div class="app-device-area mb-4 ml-lg-3 text-center text-lg-left">
		{{ app.sub.device.setDeviceJson(item.device) }}
		<span class="device-icon {{ app.sub.device.getHtmlIconName() }}"></span>
		<span class="text-muted align-middle">{{ app.sub.lang.parse.parse('discussion.posts.device.text', app.sub.device.getClient())|raw }}</span>
	</div>
	{% if firstpost %}
		{% if item.is_open %}
			{% import 'macro.editor.tpl' as editor %}
		    {{ editor.editor('app-create-discussion-post', false) }}
		{% else %}
			<div class="text-center text-dark mb-3">{{ app.sub.lang.string.discussion.locked_text }}</div>
		{% endif %}
		<div class="app-post-manage d-flex mb-4">
			<div class="app-order-discussion-post dropdown">
				{% if string.post.getDiscussionPostCount() > 1 %}
					<button class="btn btn-app-dd no-anim-ui icon order-newest dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{ app.sub.lang.string.container.order.new_message }}</button>
					<div class="dropdown-menu dropdown-menu-left custom-menu custom-menu-md shadow animate slideIn" aria-labelledby="dropdownMenuButton">
						<div class="title">
							<div>
								<span>{{ app.sub.lang.string.container.order.title }}</span>
							</div>
						</div>
						<div>
							<a class="notification quick-menu d-flex active" data-ui="order-discussion-posts" data-order="newest" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.new_message }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-discussion-posts" data-order="top-likes" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.top_likes }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-discussion-posts" data-order="oldest" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.oldest }}</span>
								</div>
							</a>
						</div>
					</div>
				{% else %}
					<button class="btn btn-app-dd no-anim-ui icon order-newest dropdown-toggle disabled" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" disabled="disabled">{{ app.sub.lang.string.container.order.new_message }}</button>
					<div class="dropdown-menu dropdown-menu-left custom-menu custom-menu-md shadow animate slideIn" aria-labelledby="dropdownMenuButton">
						<div class="title">
							<div>
								<span>{{ app.sub.lang.string.container.order.title }}</span>
							</div>
						</div>
						<div>
							<a class="notification quick-menu d-flex active" data-ui="order-discussion-posts" data-order="newest" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.new_message }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-discussion-posts" data-order="top-likes" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.top_likes }}</span>
								</div>
							</a>
							<a class="notification quick-menu d-flex" data-ui="order-discussion-posts" data-order="oldest" href="#">
								<div class="text ml-3">
									<span>{{ app.sub.lang.string.container.order.oldest }}</span>
								</div>
							</a>
						</div>
					</div>
				{% endif %}
			</div>
			<button class="post-refresh ml-4" data-ui="discussion-post-refresher"></button>
			<div class="align-self-center h5 mb-0 ml-auto text-dark">{{ app.sub.lang.parse.Parse('discussion.first_post.posts', (string.post.getDiscussionPostCount() - 1)) }}</div>
		</div>
	{% endif %}
	{% if firstpost %}
		{% if string.post.getDiscussionPostCount() < 2 %}
		    {% if app.user.loggedIn() %}
			    <div class="no-post d-block">
				    <span>{{ app.sub.lang.string.container.no_post.none }}</span>
				    <p data-ui="show-editor">{{ app.sub.lang.string.container.no_post.new_post }}</p>
			   </div>
		    {% else %}
			    <div class="no-post d-block">
				    <span>{{ app.sub.lang.string.container.no_post.none }}</span>
				    <p data-ui="show-editor">{{ app.sub.lang.string.container.no_post.new_post }}</p>
			    </div>
		    {% endif %}
	    {% endif %}
	{% endif %}
</div>
{% endmacro %}