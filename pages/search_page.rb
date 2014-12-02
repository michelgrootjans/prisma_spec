class SearchPage < GenericPage
  set_url '/v2/zoeken'

  def goto_project_result identificatie
    within '.project' do
      click_on identificatie
    end
  end
end