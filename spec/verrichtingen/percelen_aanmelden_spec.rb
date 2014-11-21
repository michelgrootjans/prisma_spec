require 'spec_helper'

describe 'kan de kaart invullen' do
  before :each do
    log_in_as_shm

    visit "V2/Projecten/#{project_identificatie}"

    # verrichting aanmaken
    find('.verrichting-add-tile').click
    click_on 'Nieuwbouw'

    # select perceel
    click_on "Zoek op adres"
    select 'Antwerpen',  from: "Gemeente"
    select 'Acacialaan', from: "Straat"
    select '14',         from: "Huisnummer"
    click_on 'Zoeken'
    click_on 'Zoom'
    click_on 'Selecteer perceel'
  end

end