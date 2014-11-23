# encoding: UTF-8
require 'spec_helper'
require_relative 'shared_examples'

describe "Verwerving aanmelden" do
  let(:verrichting_name){ "Testverrichting: #{Faker::Company.name}" }
  let(:opmerkingen){ Faker::Company.bs }
  let(:project_identificatie){ '2007/1222' }

  before :each do
    log_in_as_shm

    visit "V2/Projecten/#{project_identificatie}"

    # verrichting aanmaken
    find('.verrichting-add-tile').click
    click_on 'Onroerende transacties'

    # fill aanmelding
    fill_in 'Omschrijving', with: verrichting_name
    fill_in 'Kostprijs', with: "150000"
    fill_in 'Aantal kavels', with: "5"
    fill_in 'Datum goedgekeurd RUP of BPA', with: '18/11/2014'
    fill_in 'Opmerkingen', with: opmerkingen
    click_on 'Opslaan'
  end

  it "gaat naar de verrichtingspagina" do
    page.should have_content verrichting_name
    page.should have_content "150.000,00"
    page.should have_content "Voorfinanciering Prefinanciering"
    page.should have_content "Financiering Gefinancierd volgens financieringsbesluit"
    page.should have_content "Kavels 5"
    page.should have_content "Datum goedgekeurd RUP of BPA 18/11/2014"
    page.should have_content opmerkingen
  end

  it_behaves_like "een aangemelde verrichting"

end