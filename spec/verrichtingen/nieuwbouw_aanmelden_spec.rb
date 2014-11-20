# encoding: UTF-8
require 'spec_helper'
require_relative 'shared_examples'

describe "Nieuwbouw aanmelden" do
  let(:verrichting_name){ "Testverrichting: #{Faker::Name.name}" }
  let(:opmerkingen){ Faker::Lorem.sentence }
  let(:project_identificatie){ '2007/1222' }

  before :each do
    log_in_as_shm

    visit "v2/Projecten/#{project_identificatie}"

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

    # fill aanmelding
    fill_in 'Omschrijving', with: verrichting_name
    fill_in 'AantalHuurwoningen', with: "20"
    fill_in 'AantalKoopwoningen', with: "5"
    fill_in 'Raming kostprijs', with: "1000000"
    fill_in 'Jaar van aanbesteding', with: '2018'
    check 'Appartementen'
    check '4/5'
    check '5/6'
    fill_in 'Opmerkingen', with: opmerkingen
    click_on 'Opslaan'
  end

  it "gaat naar de verrichtingspagina" do
    page.should have_content verrichting_name
    page.should have_content "Huurwoningen 20"
    page.should have_content "Koopwoningen 5"
    page.should have_content "Gebouwtypes Appartementen"
    page.should have_content "Raming kostprijs € 1.000.000"
    page.should have_content "Jaar van aanbesteding 2018"
    page.should have_content "Woningtypes 4/5, 5/6"
    page.should have_content opmerkingen
  end

  it_behaves_like "een aangemelde verrichting"

end