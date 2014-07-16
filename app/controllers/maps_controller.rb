class MapsController < ApplicationController

  include ApplicationHelper

  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index

    if params[:location] && params[:keyword]
      @places = Yelp.client.search(params[:location], { term: params[:keyword], filter_radius: 0.03, limit: 7})
    end
    respond_to do |format|
      format.html
      format.json { render json: @places ? result_coords(@places) : [] }
    end
  end



  # GET /maps/1
  # GET /maps/1.json
  def show

  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)

    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render action: 'show', status: :created, location: @map }
      else
        format.html { render action: 'new' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /maps/1
  # # PATCH/PUT /maps/1.json
  # def update
  #   respond_to do |format|
  #     if @map.update(map_params)
  #       format.html { redirect_to @map, notice: 'Map was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: 'edit' }
  #       format.json { render json: @map.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end


    def get_coords(location)
    formatted_address = location.join(" ")

    geocoder_result = Geocoder.search(formatted_address).first
    geocoder_result.data["geometry"]["location"] if (geocoder_result && geocoder_result.data && geocoder_result.data["geometry"])
  end

  def result_coords(results)
    results.businesses.map do |result|
      puts result.location.display_address
      address = get_coords(result.location.display_address)
      name = result.name
      display_address = result.location.display_address
    { "name" => name,
      "address" => address,
      "display_address" => display_address
    }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:coordinates, :name, :description, :user_id, :profile_id)
    end

end
