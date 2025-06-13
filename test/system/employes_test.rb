require "application_system_test_case"

class EmployesTest < ApplicationSystemTestCase
  setup do
    @employe = employes(:one)
  end

  test "visiting the index" do
    visit employes_url
    assert_selector "h1", text: "Employes"
  end

  test "should create employe" do
    visit employes_url
    click_on "New employe"

    fill_in "Garage", with: @employe.garage_id
    fill_in "Nom", with: @employe.nom
    fill_in "Specialite", with: @employe.specialite
    click_on "Create Employe"

    assert_text "Employe was successfully created"
    click_on "Back"
  end

  test "should update Employe" do
    visit employe_url(@employe)
    click_on "Edit this employe", match: :first

    fill_in "Garage", with: @employe.garage_id
    fill_in "Nom", with: @employe.nom
    fill_in "Specialite", with: @employe.specialite
    click_on "Update Employe"

    assert_text "Employe was successfully updated"
    click_on "Back"
  end

  test "should destroy Employe" do
    visit employe_url(@employe)
    click_on "Destroy this employe", match: :first

    assert_text "Employe was successfully destroyed"
  end
end
