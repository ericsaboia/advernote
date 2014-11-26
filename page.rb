require 'open-uri'
require 'nokogiri'

class Page
	def initialize
		@doc = Nokogiri::HTML(open("http://www.jusbrasil.com.br/diarios/80288652/dosp-cidade-18-11-2014-pg-3"))
	end

  def nomination
    element = @doc.at("p:contains('TÍTULO DE NOMEAÇÃO')")
    text = "<p>#{element.text}</p>"

    while element.text.strip != 'FERNANDO HADDAD, Prefeito' do
      element = element.next_sibling
      text += "<p>#{element.text}</p>"
    end

    text
  end
end