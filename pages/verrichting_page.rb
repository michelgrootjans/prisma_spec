class VerrichtingPage < GenericPage
  set_url '/v2/Verrichting{/id1}{/id2}{/id3}'
  set_url_matcher /(V|v)errichtingen\/\d+\/\d+\/\d+/
end