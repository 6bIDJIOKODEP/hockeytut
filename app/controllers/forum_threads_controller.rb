class ForumThreadsController < ApplicationController
  before_action :set_forum_thread, only: [:show, :edit, :update, :destroy]
  before_action :find_forum, only: [:show, :new, :create, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @forum_threads = ForumThread.all
  end

  def show
    @forum_comments = @forum_thread.forum_comments.paginate(:page => params[:page], :per_page => 8)
  end
  # GET /forum_threads/new
  def new
    @forum_thread = @forum.forum_threads.build
  end

  # GET /forum_threads/1/edit
  def edit
  end

  # POST /forum_threads
  # POST /forum_threads.json
  def create
    @forum_thread = @forum.forum_threads.create(forum_thread_params)    

    respond_to do |format|
      if @forum_thread.save
        format.html { redirect_to forum_forum_thread_path(@forum.id, @forum_thread.id), notice: 'Forum thread was successfully created.' }
        format.json { render :show, status: :created, location: forum_forum_thread_path(@forum.id, @forum_thread.id) }
      else
        format.html { render :new }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forum_threads/1
  # PATCH/PUT /forum_threads/1.json
  def update
    respond_to do |format|
      if @forum_thread.update(forum_thread_params)
        format.html { redirect_to forum_forum_thread_path(@forum.id, @forum_thread.id), notice: 'Forum thread was successfully updated.' }
        format.json { render :show, status: :ok, location: forum_forum_thread_path(@forum.id, @forum_thread.id) }
      else
        format.html { render :edit }
        format.json { render json: @forum_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forum_threads/1
  # DELETE /forum_threads/1.json
  def destroy
    @forum_thread.destroy
    respond_to do |format|
      format.html { redirect_to @forum, notice: 'Forum thread was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_forum
      @forum = Forum.find(params[:forum_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forum_thread_params
      params.require(:forum_thread).permit(:subject, :main_discussion_text, :forum_id, :user_id)
    end
end
