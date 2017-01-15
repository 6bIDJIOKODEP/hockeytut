class ForumCommentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@forum_comment = current_user.forum_comments.create(forum_comment_params)

    respond_to do |format|
      if @forum_comment.save
        format.html { redirect_to forum_forum_thread_path(@forum_comment.forum.id, @forum_comment.forum_thread.id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: forum_forum_thread_path(@forum_comment.forum.id, @forum_comment.forum_thread.id) }
      else
        format.html { render :new }
        format.json { render json: @forum_comment.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@forum_comment = ForumComment.find(params[:id])
		forum_thread = @forum_comment.forum_thread
		@forum_comment.destroy

    respond_to do |format|
      format.html { redirect_to forum_forum_thread_path(@forum_comment.forum.id, @forum_comment.forum_thread.id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
	end

	private
	
		def forum_comment_params
			params.require(:forum_comment).permit(:body, :user_id, :forum_thread_id, :forum_id)
		end

end
