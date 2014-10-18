
require 'spec_helper.rb'

describe "Searching for a video" do
  it "allows searches for general terms" do
    visit ""
    fill_in('search_query', :with => "text adventures")
    click_button('search-btn')
    page.should have_content("GET LAMP: The Text Adventure Documentary")
  end
end