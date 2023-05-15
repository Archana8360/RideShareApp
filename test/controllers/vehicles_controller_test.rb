require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url, as: :json
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference("Vehicle.count") do
      post vehicles_url, params: { vehicle: { country: @vehicle.country, user_id: @vehicle.user_id, vehicle_brand: @vehicle.vehicle_brand, vehicle_color: @vehicle.vehicle_color, vehicle_model_year: @vehicle.vehicle_model_year, vehicle_name: @vehicle.vehicle_name, vehicle_number: @vehicle.vehicle_number, vehicle_type: @vehicle.vehicle_type } }, as: :json
    end

    assert_response :created
  end

  test "should show vehicle" do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { country: @vehicle.country, user_id: @vehicle.user_id, vehicle_brand: @vehicle.vehicle_brand, vehicle_color: @vehicle.vehicle_color, vehicle_model_year: @vehicle.vehicle_model_year, vehicle_name: @vehicle.vehicle_name, vehicle_number: @vehicle.vehicle_number, vehicle_type: @vehicle.vehicle_type } }, as: :json
    assert_response :success
  end

  test "should destroy vehicle" do
    assert_difference("Vehicle.count", -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response :no_content
  end
end
