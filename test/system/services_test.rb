require "application_system_test_case"

class ServicesTest < ApplicationSystemTestCase
  setup do
    @service = services(:one)
  end

  test "visiting the index" do
    visit services_url
    assert_selector "h1", text: "Services"
  end

  test "should create service" do
    visit services_url
    click_on "New service"

    fill_in "Cout", with: @service.cout
    fill_in "Date", with: @service.date
    fill_in "Employe", with: @service.employe_id
    fill_in "Type service", with: @service.type_service
    fill_in "Voiture", with: @service.voiture_id
    click_on "Create Service"

    assert_text "Service was successfully created"
    click_on "Back"
  end

  test "should update Service" do
    visit service_url(@service)
    click_on "Edit this service", match: :first

    fill_in "Cout", with: @service.cout
    fill_in "Date", with: @service.date
    fill_in "Employe", with: @service.employe_id
    fill_in "Type service", with: @service.type_service
    fill_in "Voiture", with: @service.voiture_id
    click_on "Update Service"

    assert_text "Service was successfully updated"
    click_on "Back"
  end

  test "should destroy Service" do
    visit service_url(@service)
    click_on "Destroy this service", match: :first

    assert_text "Service was successfully destroyed"
  end
end
