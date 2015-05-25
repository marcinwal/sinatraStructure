require 'spec_helper'

feature "home page" do 
  scenario "i should see the home page" do 
    visit '/'
    expect(page).to have_content("THE END")
  end
end
