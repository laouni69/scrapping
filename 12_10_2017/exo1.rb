require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	doc.xpath('.//*[@class="lientxt"]/@href').each do |node|
	url = ("http://annuaire-des-mairies.com"+ (node.text[1..-1]))

	doc = Nokogiri::HTML(open(url))
	mail = doc.css('font')[29].text
	ville = doc.css('h1').text
	
table = [ville, mail]
	p table
end
end

get_all_the_urls_of_val_doise_townhalls
