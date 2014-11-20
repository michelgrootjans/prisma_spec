require 'spec_helper.rb'

describe "Zoeken naar 'arkenvest'" do
  before :each do
    log_in_as_shm
    visit "/v2"
    fill_in 'query', with: "arkenvest"
    find(".glyphicon-search").click
  end

  it "toont project arkenvest" do
    page.should have_text "2008/0936 Arkenvest"

    within '.project' do
      click_on "2008/0936"
    end
    
    page.should have_text "2008/0936 Arkenvest"
    page.should have_text "Woonpunt Zennevallei"
  end

  it "toont verrichting arkenvest" do
    page.should have_text "2008/0936/02 Arkenvest - 22 huurw"

    click_on "2008/0936/02"
    
    page.should have_text "2008/0936/02: Arkenvest - 22 huurw"
    page.should have_text "Omschrijving Verwerving Halle, Arkenvest (22 huur / 0 koop)"
  end
end