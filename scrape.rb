require "httparty"
require "nokogiri"

# use httparty to get the things we want to get

@response = HTTParty.get('http://pitchfork.com/reviews/albums/')

@data = Nokogiri::HTML( @response.body )

# a list of the review titles
@reviews = @data.css("a.review__link")

@reviews.each do |review|
    puts "New album from..."
    puts review.css("li")[0].content
    puts review.css("h2")[0].content
    puts "https://pitchfork.com" + review.attr("href")
    puts "-------"
end