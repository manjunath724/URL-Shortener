require "rails_helper"

RSpec.feature "Shortener service abbreviates the URL", type: :feature do
  before(:each) do
    visit root_path
  end

  scenario "User inputs a new URL" do
    rand(10).times do
      add_url
    end

    expect(page).to have_text("Shortener was successfully created.")
  end

  scenario "User inputs different paths of same URL" do
    rand(10).times do
      append_url('example.com')
    end

    expect(page).to have_text("Shortener was successfully created.")
  end

  scenario "User clicks on create button without input value" do
    click_link "Add New"

    click_button "Create Shortener"

    expect(page).to have_text("URL can't be blank.")
  end

  scenario "User removes a record" do
    remove_url

    expect(page).to have_text("Shortener was successfully removed.")
  end

  scenario "User redirects to URL" do
    abbrev_redirection
  end

  scenario "User navigates through pages" do
    navigate_pagination
  end
end
