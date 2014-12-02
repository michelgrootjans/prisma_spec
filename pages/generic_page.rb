class GenericPage < SitePrism::Page
  element :search_field, "input[name='query']"
  element :search_button, ".glyphicon-search"

  def search_for query    
    search_field.set query
    search_button.click
  end

end