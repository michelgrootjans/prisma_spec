# encoding: UTF-8
require 'spec_helper'
require_relative 'shared_examples'

describe "Infrastructuur aanmelden" do
  let(:verrichting_name){ "Testverrichting: #{Faker::Company.name}" }
  let(:opmerkingen){ Faker::Company.bs }
  let(:project_identificatie){ '2007/1222' }

  before :each do
    log_in_as_shm

    visit "V2/Projecten/#{project_identificatie}"

    # verrichting aanmaken
    find('.verrichting-add-tile').click
    click_on 'Infrastructuur'

    # fill aanmelding
    fill_in 'Omschrijving', with: verrichting_name
    fill_in 'Raming kostprijs', with: "150000"
    check "Terrein reeds bouwrijp?"
    fill_in 'Aantal kavels', with: '12'
    fill_in 'Opmerkingen', with: opmerkingen
    check 'Omgevingswerken'
    check 'Rioleringswerken'
    check 'Sloop'
    click_on 'Opslaan'
  end

  it "gaat naar de verrichtingspagina" do
    page.should have_content verrichting_name
    page.should have_content "Uitvoering in eigen beheer"
    page.should have_content "150.000,00"
    page.should have_content "Terrein reeds bouwrijp? Ja"
    page.should have_content "Aantal kavels 12"
    page.should have_content opmerkingen
    page.should have_content "Omgevingswerken, Rioleringswerken, Sloop"
  end

  it_behaves_like "een aangemelde verrichting"

end