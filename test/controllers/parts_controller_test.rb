require "test_helper"

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "should get index" do
    get parts_url
    assert_response :success
  end

  test "should get new" do
    get new_part_url
    assert_response :success
  end

  test "should create part" do
    assert_difference("Part.count") do
      post parts_url, params: { part: { nom: @part.nom, prix: @part.prix, stock: @part.stock, voiture_id: @part.voiture_id } }
    end

    assert_redirected_to part_url(Part.last)
  end

  test "should show part" do
    get part_url(@part)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_url(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { nom: @part.nom, prix: @part.prix, stock: @part.stock, voiture_id: @part.voiture_id } }
    assert_redirected_to part_url(@part)
  end

  test "should destroy part" do
    assert_difference("Part.count", -1) do
      delete part_url(@part)
    end

    assert_redirected_to parts_url
  end
end
