require "test_helper"

class InfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @info = infos(:one)
  end

  test "should get index" do
    get infos_url, as: :json
    assert_response :success
  end

  test "should create info" do
    assert_difference("Info.count") do
      post infos_url, params: { info: { dob: @info.dob, first_name: @info.first_name, last_name: @info.last_name, phone_no: @info.phone_no, prefix: @info.prefix, user_id: @info.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show info" do
    get info_url(@info), as: :json
    assert_response :success
  end

  test "should update info" do
    patch info_url(@info), params: { info: { dob: @info.dob, first_name: @info.first_name, last_name: @info.last_name, phone_no: @info.phone_no, prefix: @info.prefix, user_id: @info.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy info" do
    assert_difference("Info.count", -1) do
      delete info_url(@info), as: :json
    end

    assert_response :no_content
  end
end
