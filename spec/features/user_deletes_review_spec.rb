require 'rails_helper'
feature "user deletes review" do
  scenario "user adds a review successfully and deletes successfully" do
    create_zoo
    fill_in 'Comment', with: "This zoo is awesome!"
    choose(5)
    click_button "Add Review"
    click_link "Delete Review"
    expect(page).to have_content "Review deleted successfully"
    expect(page).to have_content "Franklin Park Zoo"
  end
  scenario "user that didn't create review can't delete zoo" do
    create_zoo
    fill_in 'Comment', with: "This zoo is awesome!"
    choose(5)
    click_button "Add Review"
    sign_out
    sign_in_as_dummy
    visit root_path
    click_link "Franklin Park Zoo"
    expect(page).to have_content "Franklin Park Zoo"
    expect(page).to have_content "Boston"
    expect(page).to_not have_content "Delete Review"
  end
end
