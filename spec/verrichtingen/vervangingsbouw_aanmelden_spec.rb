# encoding: UTF-8
require 'spec_helper'
require_relative 'shared_examples'

describe "Vervangingsbouw aanmelden" do
  let(:verrichting_name){ "Testverrichting: #{Faker::Company.name}" }
  let(:opmerkingen){ Faker::Company.bs }
  let(:project_identificatie){ '2007/1222' }

  before :each do
    log_in_as_shm

    visit "v2/Projecten/#{project_identificatie}"

    # verrichting aanmaken
    find('.verrichting-add-tile').click
    click_on 'Vervangingsbouw'

    # fill aanmelding
    fill_in 'Omschrijving', with: verrichting_name
    fill_in 'AantalHuurwoningen', with: "20"
    fill_in 'AantalKoopwoningen', with: "5"
    fill_in 'AantalAfTeBrekenHuurWoningen', with: "28"
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
    page.should have_content "Af te breken woningen 28"
    page.should have_content "Gebouwtypes Appartementen"
    page.should have_content "Raming kostprijs € 1.000.000"
    page.should have_content "Jaar van aanbesteding 2018"
    page.should have_content "Woningtypes 4/5, 5/6"
    page.should have_content opmerkingen
  end

  it_behaves_like "een aangemelde verrichting"


  it "verwerkt de  wijzigingen" do
    click_on '#edit-verrichting'

    fill_in 'Omschrijving', with: "Nieuwe omschrijving"
    fill_in 'AantalHuurwoningen', with: "30"
    fill_in 'AantalKoopwoningen', with: "15"
    fill_in 'AantalAfTeBrekenHuurWoningen', with: "35"
    fill_in 'Raming kostprijs', with: "500000"
    fill_in 'Jaar van aanbesteding', with: '2019'
    uncheck 'Appartementen'
    check 'Eengezinswoningen'
    check '4/5'
    check '4/6'
    fill_in 'Opmerkingen', with: "Nieuwe opmerking"
    click_on 'Opslaan'

    page.should have_content "Nieuwe omschrijving"
    page.should have_content "Huurwoningen 30"
    page.should have_content "Koopwoningen 15"
    page.should have_content "Af te breken woningen 35"
    page.should have_content "Gebouwtypes Eengezinswoningen"
    page.should have_content "Raming kostprijs € 500.000"
    page.should have_content "Jaar van aanbesteding 2019"
    page.should have_content "Woningtypes 4/5, 4/6"
    page.should have_content "Nieuwe opmerking"
  end

end