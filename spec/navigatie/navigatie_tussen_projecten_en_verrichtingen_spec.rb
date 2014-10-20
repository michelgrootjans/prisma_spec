require 'spec_helper.rb'

describe "Verrichting zoeken" do
  before :each do
    log_in_as_shm
  end

  it "vertrekkend van project" do
    visit "v2/projecten/2009/0057"

    page.should have_content "Sint-Truiden - Sluisberg en Ursulinenstraat"
    page.should have_content "2009/0057/01"
    page.should have_content "2009/0057/02"
    page.should have_content "2009/0057/03"
    page.should have_content "2009/0057/04"

    click_on "Bouw 2009/0057/02"

    page.should have_content "Gemeente SINT-TRUIDEN"
    page.should have_content "Werfopzichter Eddie NYS"
    page.should have_content "Sector Architect Els STRUYF"

  end
end