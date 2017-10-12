require 'rubygems'
require 'open-uri' 
require 'nokogiri'
def crypto
	prices = []
	monnaies = [] 	
	table = []
 
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 
	doc.xpath('//td[@class="no-wrap currency-name"]/a').each do |monnaie|
	monnaies<<monnaie.text
	end
	doc.xpath('.//*[@class="price"]').each do |price|
	prices<<price.text
end
table = monnaies.zip(prices).map { |monnaie,price|{:monnaies==>monnaie, :price==>price }}
puts table
end
crypto()
