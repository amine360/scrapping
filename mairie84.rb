require 'nokogiri'
require 'open-uri'
require 'google_drive'
require 'rubygems'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/rhone.html"))
links = page.css("a.lientxt")
liste = links.each{|departement|
    a = "http://annuaire-des-mairies.com" + departement['href'].slice!(1..33)
    puts a
mailv = Nokogiri::HTML(open(a))
mailv.css('p:contains("@")').each do |node|
puts node.text
end
}