shared_examples_for "een aangemelde verrichting" do
    it "kan worden gepubliceerd" do
        click_on 'Publiceren'
        page.should_not have_content 'Publiceren'
    end

    it "kan worden verwijderd" do 
        click_on 'Acties'
        click_on 'Verwijderen'

        within '.modal' do
            click_on 'Verwijderen'
        end

        current_path.should == "/V2/Projecten/#{project_identificatie}"
    end

    it "toont geldige data" do
        page.should have_content 'Initiatiefnemer Woonhaven Antwerpen (woonhaven.antwerpen@woonhaven.be)'
        page.should have_content "Fase Ingediend"
    end
end

shared_examples_for "een editeerbare verrichting" do |arrange, assert|
end 

