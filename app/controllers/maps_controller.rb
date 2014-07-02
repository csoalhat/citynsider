class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy]

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
    @places = Yelp.client.search("nw34nx", { term: 'posh', filter_radius: 2, limit: 9})
#     @directions= { origin: @places.businesses[0],
#                   destination: @places.businesses[0],
#                   waypoints: [
#                     {
#                       location: @places.businesses[1]
#                     },{
#                       location: @places.businesses[2]
#                     },{
#                       location: @places.businesses[3]
#                     },{
#                       location: @places.businesses[4]
#                     },{
#                       location: @places.businesses[5]
#                     },{
#                       location: @places.businesses[6]
#                     },{
#                       location: @places.businesses[7]
#                     },{
#                       location: @places.businesses[8]
#                     }],
#                   provideRouteAlternatives: false,
#                   travelMode: TravelMode.WALKING,
#                   unitSystem: UnitSystem.IMPERIAL
# }
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

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params[:map]
    end
end
