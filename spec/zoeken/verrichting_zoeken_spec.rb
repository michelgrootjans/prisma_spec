require 'spec_helper.rb'

describe "Zoeken naar 'arkenvest'" do
  let(:home_page)   { HomePage.new }
  let(:search_page) { SearchPage.new }

  before :each do
    log_in_as_shm
    home_page.load
    home_page.search_for 'arkenvest'
  end

  it "toont project arkenvest" do
    search_page.should have_text "2008/0936 Arkenvest"
    search_page.goto_project_result '2008/0936'
    
    project_page = ProjectPage.new
    project_page.should be_displayed
    project_page.should have_text "2008/0936 Arkenvest"
    project_page.should have_text "Woonpunt Zennevallei"
  end

  it "toont verrichting arkenvest" do
    search_page.should have_text "2008/0936/02 Arkenvest - 22 huurw"
    search_page.click_on "2008/0936/02"
    
    verrichting_page = VerrichtingPage.new
    verrichting_page.should be_displayed
    verrichting_page.should have_text "2008/0936/02: Arkenvest - 22 huurw"
    verrichting_page.should have_text "Omschrijving Verwerving Halle, Arkenvest (22 huur / 0 koop)"
  end
end