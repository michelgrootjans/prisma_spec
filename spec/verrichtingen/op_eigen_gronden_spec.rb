require 'spec_helper'

voorbeelden = {
  'Nieuwbouw'       => '2014/0188/01',
  'Vervangingsbouw' => '2014/0085/03'
}
describe "SHM" do
  voorbeelden.each do |type, identificatie|
    let(:verrichting_url){ "/v2/verrichtingen/#{identificatie}" }

    before :each do
        log_in_as_shm
        visit verrichting_url
    end

    describe type do
      it "ziet het veld 'Op eigen gronden?' niet" do
        pending
        page.should_not have_content 'Op eigen gronden?'
      end

      it "kan het veld 'Op eigen gronden?' niet wijzigen" do
        pending
        click_on '#edit-verrichting'
        page.should_not have_content 'Op eigen gronden?'
      end
    end
  end
end

describe "Gemeente" do
  voorbeelden.each do |type, identificatie|
    let(:verrichting_url){ "/v2/verrichtingen/#{identificatie}" }

    before :each do
        log_in_as_shm
        visit verrichting_url
    end

    describe type do
      it "ziet het veld 'Op eigen gronden?'" do
        page.should have_content 'Op eigen gronden?'
      end

      it "kan het veld 'Op eigen gronden?' wijzigen" do
        pending
        click_on '#edit-verrichting'
        page.should have_content 'Op eigen gronden?'
      end
    end

  end
end
