require "rails_helper"
require 'pry'

describe ProfilePhotoUploader do
  # include CarrierWave::Test::Matchers
  # let(:user) { double('user') }
  #
  # let(:uploader) { ProfilePhotoUploader.new(user, :profile_photo) }
  #
  # before do
  #   ProfilePhotoUploader.enable_processing = true
  #   File.open("#{Rails.root}/spec/support/images/photo.png") { |f| uploader.store!(f) }
  # end
  #
  # after do
  #   ProfilePhotoUploader.enable_processing = false
  #   uploader.remove!
  # end

  feature "profile photo" do
    scenario "user uploads a profile photo" do
      visit root_path
      click_link "Sign Up"

      fill_in "Email", with: "ash@s-mart.com"
      fill_in "Password", with: "boomstick!3vilisd3ad"
      fill_in 'Password confirmation', with: "boomstick!3vilisd3ad"
      attach_file "user_profile_photo", "#{Rails.root}/spec/support/images/photo.png"
      click_button "Sign Up"
      expect(page).to have_content("Welcome! You have signed up successfully.")
      click_link "Edit Profile"
      expect(page).to have_css("img[src*='photo.png']")
    end

    scenario "user doesn't upload a profile photo" do
      visit root_path
      click_link "Sign Up"

      fill_in "Email", with: "ash@s-mart.com"
      fill_in "Password", with: "boomstick!3vilisd3ad"
      fill_in 'Password confirmation', with: "boomstick!3vilisd3ad"
      click_button "Sign Up"
      expect(page).to have_content("Welcome! You have signed up successfully.")
      click_link "Edit Profile"
      expect(page).to_not have_css("img")
    end
  end


end
