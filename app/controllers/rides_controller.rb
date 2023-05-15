class RidesController < ApplicationController
  before_action :set_ride, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /rides
  def index
    @rides = Ride.all
    render json: @rides
  end

  # GET /rides/1
  def show
    render json: @ride
  end

  # POST /rides
  def create
    @ride = Ride.new(ride_params)

    if @ride.save
      render json: @ride, status: :created, location: @ride
    else
      render json: @ride.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rides/1
  def update
    if @ride.update(ride_params)
      render json: @ride
    else
      render json: @ride.errors, status: :unprocessable_entity
    end
  end

  def searchRide
    source_rides = Ride.near([params[:source_lat], params[:source_long]], 30, units: :km,latitude: :source_lat, longitude: :source_long)
    destination_rides = Ride.near([params[:destination_lat], params[:destination_long]], 30, units: :km,latitude: :destination_lat, longitude: :destination_long)
    @rides = source_rides & destination_rides
    @ride_filter
    if params[:date]
      @ride_filter = Ride.where("date":params[:date])
    end
    if params[:no_of_seats]
      @ride_filter = @ride.where("no_of_seats >= ?",params[:no_of_seats])
    end
    if @rides.length>0
      render json: @rides
    else 
      render json: "No rides found"
    end
  end
  
  def bookRide
    @ride = Ride.find_by(id:params[:ride_id])
    
    if @ride.no_of_seats > 0 &&  @ride.no_of_seats-params[:seats] >= 0
      
      @passenger = Passenger.create!(ride_id:params[:ride_id],user_id:current_user.id,bookedseats:params[:seats])
      @ride.no_of_seats = @ride.no_of_seats - params[:seats]
     
      @ride.save
      render json: "Ride Booked Successful"
    else
      render json: "Sorry, All seats are booked"
    end
    
      
  end


  # DELETE /rides/1
  def destroy
    @ride.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride
      @ride = Ride.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ride_params
      params.require(:ride).permit(:source, :destination, :date, :time, :about_ride, :price, :vehicle_id, :destination_lat, :destination_long, :source_lat, :source_long,:selectedRouteData,:no_of_seats).merge(driver_id: current_user.id)
    end
end
