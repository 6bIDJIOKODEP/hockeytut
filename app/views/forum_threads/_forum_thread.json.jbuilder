json.extract! forum_thread, :id, :subject, :main_discussion_text, :forum_id, :user_id, :created_at, :updated_at
json.url forum_thread_url(forum_thread, format: :json)