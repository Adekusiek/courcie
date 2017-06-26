class DemandpostsController < ApplicationController
  before_action :set_demandpost, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]

  # GET /demandposts
  # GET /demandposts.json
  def index
    # Currently ransack gem is used for posting research
    # from top page, params[:q] ic coming
    # just for city query
    # the search logic must be reevaluated
    @search = Demandpost.search(params[:q])
    @demandposts = @search.result.order(created_at: :desc).page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @demandposts }
    end
  end

  # GET /demandposts/1
  # GET /demandposts/1.json
  def show
    @c = ISO3166::Country.new(@demandpost.country_from)
  end

  # GET /demandposts/new
  def new
    @demandpost = Demandpost.new
  end

  # GET /demandposts/1/edit
  def edit
  end

  # POST /demandposts
  # POST /demandposts.json
  def create
    @demandpost = Demandpost.new(demandpost_params)

    respond_to do |format|
      if @demandpost.save
        format.html { redirect_to @demandpost, notice: 'Demandpost was successfully created.' }
        format.json { render :show, status: :created, location: @demandpost }
      else
        format.html { render :new }
        format.json { render json: @demandpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demandposts/1
  # PATCH/PUT /demandposts/1.json
  def update
    respond_to do |format|
      if @demandpost.update(demandpost_params)
        format.html { redirect_to @demandpost, notice: 'Demandpost was successfully updated.' }
        format.json { render :show, status: :ok, location: @demandpost }
      else
        format.html { render :edit }
        format.json { render json: @demandpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demandposts/1
  # DELETE /demandposts/1.json
  def destroy
    @demandpost.destroy
    respond_to do |format|
      format.html { redirect_to demandposts_url, notice: 'Demandpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demandpost
      @demandpost = Demandpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demandpost_params
      params.require(:demandpost).permit(:city_to, :city_from, :country_from, :expire_date, :item_description, :money_ok, :no_money_ok, :reward_description).merge(user_id: current_user.id)
    end
end
