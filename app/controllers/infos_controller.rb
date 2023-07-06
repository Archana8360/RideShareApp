


class InfosController < ApplicationController
  before_action :set_info, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /infos
  def index
    @infos = Info.find_by(user_id:current_user.id)
    
    
    render json: {
      status: {code: 200, message: 'My profile', data: @infos}
    }

  end

  # GET /infos/1
  def show 

    @ratings = Rating.where(rating_receiver:@info.user_id)
    @rating_average = @ratings.average(:rating)
    @ratings_group = @ratings.group(:rating).count
    if @ratings.length >0
      @rating = {average:@rating_average,groups:@ratings_group,data:@ratings}
    else
      @rating = {error:"No rating are received yet"}
    end
    render json: {
      status: {code: 200, message: 'My profile', data: @info,rating:@rating}
    }
  end

  # POST /infos
  def create
    @info = Info.find_by(user_id: current_user.id)
    if @info.nil?
      @info = Info.new(info_params)
      if @info.save
        
        render json: @info, status: :created, location: @info
      else
        render json: @info.errors, status: :unprocessable_entity
      end
    else
      if @info.update(info_params)
        render json: @info
      else
        render json: @info.errors, status: :unprocessable_entity
      end
    end
  end


  # PATCH/PUT /infos/1
  def update
    if @info.update(info_params)
      render json: @info
    else
      render json: @info.errors, status: :unprocessable_entity
    end
  end


  def confirmemail
  
    @email = current_user.email

    
  
  end

  def sendotp
    @info = Info.find_by(phone_no:params[:mobile])
    if @info && @info.send_passcode
      render(json: {message: 'Sent passccode'}, status: :ok)
    else
      render(json: {error: 'failed to send passcode'}, status: :unauthorized)
    end
  end

  def verifyotp
    verification_params = params.permit(:mobile, :passcode)
    @info = Info.find_by(phone_no:verification_params[:mobile])
    if @info && @info.verify_passcode(verification_params[:passcode])
      render(json: {message:"Account Verified"}, status: :ok)
    else
      render(json: {error: 'Failed to verify passcode'}, status: :unauthorized)
    end
  end
  

  def givenRating
    @ratings = Rating.where(rating_giver:current_user.id)
    debugger
    if @ratings
      render json:{status:200,data:@ratings}
    else
      render json:{error:"No Rating given yet"}
    end
  end


  def recievedRating
    @ratings = Rating.where(rating_receiver:current_user.id)
    @rating_average = @ratings.average(:rating)
    @ratings_group = @ratings.group(:rating).count
    
    if @ratings.length >0
      render json:{status:200,average:@rating_average,groups:@ratings_group,data:@ratings}
    else
      render json:{error:"No rating are received yet"}
    end
  end







  # DELETE /infos/1
  def destroy
    @info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def info_params
      info = params.permit(:first_name, :last_name, :dob, :prefix, :phone_no,:image,:mini_bio).merge(user_id: current_user.id)
      return info
    end
end
