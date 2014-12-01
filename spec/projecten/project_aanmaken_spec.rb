require 'spec_helper'

describe "Project aanmaken" do
  let(:project_name){ "Testproject: #{Faker::Name.name}" }

  before :each do
    log_in_as_shm
  end

  it "kan een nieuw project aanmaken" do
    visit "v2"
    click_on "Nieuw project"

    # project aanmaken
    fill_in 'Omschrijving', with: project_name
    select 'Antwerpen', from: "Gemeente"
    click_button 'Aanmaken'

    page.should have_content project_name
    find('.verrichting-add-tile').should_not be nil
  end
end