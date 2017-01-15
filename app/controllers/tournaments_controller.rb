class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  # GET /tournaments
  # GET /tournaments.json
  def index
  end

  # GET /tournaments/1
  # GET /tournaments/1.json
  def show
    @photos = @tournament.photos
    @documents = @tournament.documents
    @reviews = @tournament.reviews.paginate(:page => params[:page], :per_page => 6)
    @left_review = @reviews.find_by(user_id: current_user.id) if current_user
  end

  # GET /tournaments/new
  def new
    @tournament = current_user.tournaments.build
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments
  # POST /tournaments.json
  def create
    @tournament = current_user.tournaments.build(tournament_params)


    respond_to do |format|
      if @tournament.save

        if params[:papers]
          params[:papers].each { |paper|
          @tournament.documents.create(paper: paper)
          }
        end

        if params[:images]
          params[:images].each { |image|
            @tournament.photos.create(image: image)
          }
        end

        format.html { redirect_to @tournament, notice: 'Tournament was successfully created.' }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new, notice: "Please make sure to fill all required fields." }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1
  # PATCH/PUT /tournaments/1.json
  def update
    respond_to do |format|

      if @tournament.update(tournament_params)

        if params[:papers]
          params[:papers].each { |paper|
          @tournament.documents.create(paper: paper)
          }
        end

        if params[:images]
          params[:images].each { |image|
            @tournament.photos.create(image: image)
          }
        end

        format.html { redirect_to @tournament, notice: 'Tournament was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1
  # DELETE /tournaments/1.json
  def destroy
    @tournament.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url, notice: 'Tournament was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      @tournament = Tournament.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_params
      params.require(:tournament).permit(:name, :tournament_type, :category, :category_camp, :teams_qty, :start_date, :end_date, 
        :address, :currency, :team_price, :player_price, :description, :latitude, :longitude, :video,
        :inhabitancy, :food, :transfer, :entertainment, :others, :phone_number, :contact_email, :club, :website, :papers, :images)
    end
end
