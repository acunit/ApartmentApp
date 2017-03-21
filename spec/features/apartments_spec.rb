require 'rails_helper'

RSpec.feature "Apartments", type: :feature do
  context "Our index page displays the created apartments" do
    Steps "check if the index page displays apartments" do
      Given "that I am on the apartments landing page" do
        visit '/apartments'
      end
      When "I create a new apartment" do
        click_link 'New Apartment'
        attach_file('apartment[image]', File.join(Rails.root, '/app/assets/images/CarrollsCrib.jpg'))
        fill_in 'Street address', with: '704 J Street'
        fill_in 'City', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'Postal', with: '92101'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Jon'
        fill_in 'Phone number', with: '123-456-7890'
        fill_in 'Opens at', with: '9:00am'
        fill_in 'Closes at', with: '8:00pm'
        click_button 'Create Apartment'
        click_link 'Back'
      end
      Then "I'm updated landing page with new apartment listed" do
        expect(page).to have_content("704 J Street")
      end
    end
  end

#   Story: As an apartment owner, I can create a new apartment listing, which shows the location of the apartment on a map.
# Hint: Create method in the model called full_address and geocode based on that.

  # context "To create a new apartment listing and then have a map dynamically generated with its location" do
  #   Steps "check if the show page's map gets populated correctly" do
  #     Given "that when I enter new apartment data" do
  #       visit '/apartments/new'
  #     end
  #     When "I create a new apartment" do
  #       fill_in 'street_address', with: '704 J Street'
  #       fill_in 'city', with: 'San Diego'
  #       fill_in 'state', with: 'CA'
  #       fill_in 'postal', with: '92101'
  #       fill_in 'country', with: 'USA'
  #       fill_in 'name', with: 'Jon'
  #       fill_in 'phone_number', with: '123-456-7890'
  #       fill_in 'opens_at', with: '9:00am'
  #       fill_in 'closes_at', with: '8:00pm'
  #       click_button 'Create Apartment'
  #     end
  #     Then "When I create a new apartment it places my apartment to have the correct information" do
  #       expect(page).to have_content("Apartment was successfully created.")
  #     end
  #   end
  # end

  # Story: As an apartment owner, I can add an image of my apartment to the listing.
  # Hint: Please only use images you have permission to use.

  context "I can add an image of an apartment to the listing page (show page)." do
    Steps "Check if the show page includes an image of the apartment when created" do
      Given "When the 'New Apartment' link is clicked on the index page" do
        visit '/apartments/new'
      end
      When "I create a new apartment and upload an image" do
        attach_file('apartment[image]', File.join(Rails.root, '/app/assets/images/CarrollsCrib.jpg'))
        fill_in 'Street address', with: '704 J Street'
        fill_in 'City', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'Postal', with: '92101'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Jon'
        fill_in 'Phone number', with: '123-456-7890'
        fill_in 'Opens at', with: '9:00am'
        fill_in 'Closes at', with: '8:00pm'
        click_button 'Create Apartment'
      end
      Then "When I create a new apartment, it takes me to the show page and lists my apartmnet information with an image of the apartment" do
        expect(page).to have_content("Apartment was successfully created.")
      end
    end
  end

  # Story: As an apartment owner, I can see an image of the apartment on the listing page.
  context "I can add an image of an apartment to the listing page (show page)." do
    Steps "Check if the show page includes an image of the apartment when created" do
      Given "When the 'New Apartment' link is clicked on the index page" do
        visit '/apartments/new'
      end
      When "I create a new apartment and upload an image" do
        attach_file('apartment[image]', File.join(Rails.root, '/app/assets/images/CarrollsCrib.jpg'))
        fill_in 'Street address', with: '704 J Street'
        fill_in 'City', with: 'San Diego'
        fill_in 'State', with: 'CA'
        fill_in 'Postal', with: '92101'
        fill_in 'Country', with: 'USA'
        fill_in 'Name', with: 'Jon'
        fill_in 'Phone number', with: '123-456-7890'
        fill_in 'Opens at', with: '9:00am'
        fill_in 'Closes at', with: '8:00pm'
        click_button 'Create Apartment'
        click_link 'Back'
      end
      Then "When I go back to the index page the page will contain the image of the apartment." do
        expect(page).to have_content("Apartment was successfully created.")
      end
    end
  end


end
