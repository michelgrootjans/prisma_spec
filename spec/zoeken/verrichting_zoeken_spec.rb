require 'spec_helper.rb'

describe "Verrichting zoeken:" do
  before :each do
    log_in_as_shm
    visit "v2/zoeken"
  end

  it "toont resultaat voor arkenvest" do
    fill_in 'query', with: "arkenvest"
    click_on 'Zoek'

    page.should have_text "2008/0936/02"
    page.should have_text "Arkenvest - 22 huurw"

    click_on "2008/0936/02"
    
    page.should have_text "Project 2008/0936"
  end
end