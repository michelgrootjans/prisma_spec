class ProjectPage < GenericPage
  set_url '/v2/Projecten{/id1}/{id2}'
  set_url_matcher /(P|p)rojecten\/\d+\/\d+/

  def show identificatie
    visit "/v2/projecten/#{identificatie}" 
  end

  def has_verrichting? content
    has_content? content
  end

  def click_on_verrichting identificatie
    click_on identificatie
  end
end