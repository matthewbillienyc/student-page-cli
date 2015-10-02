require 'nokogiri'
require 'open-uri'
require 'pry'

# puts "What student would you like to find?"

# student = gets.chomp.gsub(/ /, "_") << '.html'

document = open("https://learn-co-students.github.io/deploy-on-day-1-web-0915/")

noko_document = Nokogiri::HTML(document)

puts "What student page would you like to visit?"

student = "students/" + gets.chomp.gsub(" ","").downcase + ".html"

# all_links = noko_document.search("a[href]")
# bindin.pry
all_students_link_elems = noko_document.search("a[href^='students/']")

student_link_list = all_students_link_elems.map {|a_elem| a_elem.attr('href')}.uniq

link_hash = student_link_list.each_with_object({}) do |link, hash|
  hash[(link.gsub("_","").gsub("-","").downcase)]= link
end 

system("open https://learn-co-students.github.io/deploy-on-day-1-web-0915/#{link_hash[student]}")