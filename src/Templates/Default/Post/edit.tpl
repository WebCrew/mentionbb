<div class="modal custom-modal animate slideIn" id="post-edit" data-post-id="{{ string.post_id }}" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content shadow-lg rounded">
      <div class="modal-header justify-content-lg-center d-flex">
        <span class="font-weight-bold h5 mb-0 ml-lg-auto mr-lg-auto">{{ app.sub.lang.string.discussion.posts.edit.title }}</span>
        <span class="close d-lg-none ml-auto" data-dismiss="modal" aria-label="{{ app.sub.lang.string.container.buttons.close }}"></span>
      </div>
      <div class="modal-body">
        <form method="post" enctype="multipart/form-data">
          {% if string.is_firstpost %}
            <div class="form-group">
              <input tyoe="text" name="post-title" placeholder="{{ app.sub.lang.string.discussion.posts.edit.placeholder.title }}" value="{{ string.discussion.title }}" />
            </div>
          {% endif %}
          <div class="form-group">
            <textarea id="edit_{{ string.post_id }}" name="content"></textarea>
          </div>
          {% if app.string.attachments.getAttachmentsByPostId(string.post_id) %}
				    <hr>
				    <div class="attachment-container mt-3">
				      <p>{{ app.sub.lang.string.discussion.posts.attachments.text }}</p>
				      <div class="post-attachments edit-attachments d-flex flex-lg-row flex-wrap">
					      {% for attachment in app.string.attachments.getAttachmentsByPostId(string.post_id) %}
					        {% set mime = app.string.attachments.getMime(attachment.filename) %}
					        <div class="attachment d-flex align-items-center text-center shadow rounded mr-3 mb-3" data-attachment-id="{{ attachment.attach_id }}" data-owner-id="{{ attachment.user_id }}" data-mime-type="{{ mime.mime_type }}">
							      <div class="attachment-icon">
								        {% if mime.icon is same as('') %}
								          <i class="far fa-file-alt"></i>
								        {% else %}
								          <i class="{{ mime.icon }}"></i>
								        {% endif %}
								    </div>
							    	<div class="overflow-hidden text-left ml-2">
								      <span title="{{ attachment.filename }}" class="font-weight-bold mt-0 mb-0">
								          {{ attachment.filename }}
								      </span>
								      <small class="text-muted d-block">{{ app.string.attachments.getAttachmentSize(attachment.attach_id)|formatBytes }}</small>
							      </div>
                    <div class="ml-auto">
                      <a class="no-tooltip" title="{{ app.sub.lang.string.container.buttons.delete }}" href="#"></a>
                    </div>
						      </div>
					      {% endfor %}
				      </div>
				    </div>
				  {% endif %}
          <div class="form-group modal-file">
            <div class="row ml-auto mr-auto">
              <label for="postAttachment" class="col-sm-2 col-form-label">{{ app.sub.lang.string.container.editor.next.attachment.title }}</label>
              <div class="custom-file h-auto col-sm-10">
                <input type="file" class="custom-file-input p-0" id="discussionAttachment_{{ string.post_id }}" multiple="multiple" name="edit_post_attachment" accept="{{ app.sub.editor.attachments.getAllowedExtensionsForInput() }}">
                <label class="custom-file-label shadow-sm" for="discussionAttachment_{{ string.post_id }}" data-text="{{ app.sub.lang.string.container.buttons.browse }}">{{ app.sub.lang.string.container.buttons.select_file }}</label>
                <small id="discussionAttachment_Size" class="form-text text-muted mt-lg-1 mt-2">{{ app.sub.lang.parse.Parse('container.editor.next.attachment.max_size_text', app.settings.attachment_max_size)|raw }}</small>
              </div>
            </div>
          </div>
          <button type="submit" class="btn btn-app-complete icon no-anim-ui" data-complete-text="{{ app.sub.lang.string.discussion.posts.edit.success }}">{{ app.sub.lang.string.container.buttons.approve }}</button>
        </form>
      </div>
    </div>
  </div>
</div>