require 'spec_helper.rb'

describe "Verrichting zoeken" do
  it "zoek een verrichting" do
    visit "/v2/zoeken"
    fill_in 'query', with: "arkenvest"
    click_on 'Zoek'
    page.should have_text "2008/0936/02"
    page.should have_text "Arkenvest - 22 huurw"
  end
end