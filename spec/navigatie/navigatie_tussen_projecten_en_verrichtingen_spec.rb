require 'spec_helper.rb'

describe "Naar verrichting navigeren" do
  let(:project_page)    { ProjectPage.new }
  let(:verrichting_page){ VerrichtingPage.new }

  before :each do
    log_in_as_shm
  end

  describe "Bouwverrichtingen" do

    it "vertrekkend van project" do
      project_page.show '2009/0057'

      project_page.should be_displayed
      project_page.should have_content "Sint-Truiden - Sluisberg en Ursulinenstraat"
      project_page.should have_verrichting "2009/0057/01"
      project_page.should have_verrichting "2009/0057/02"
      project_page.should have_verrichting "2009/0057/03"
      project_page.should have_verrichting "2009/0057/04"

      project_page.click_on_verrichting "Vervangingsbouw 2009/0057/02"

      verrichting_page.should be_displayed
      verrichting_page.should have_content "Gemeente SINT-TRUIDEN"
      verrichting_page.should have_content "Werfopzichter Eddie NYS"
      verrichting_page.should have_content "Sector Architect Els STRUYF"
    end
  end
end