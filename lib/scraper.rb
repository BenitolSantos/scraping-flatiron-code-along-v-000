require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

    def get_page
      doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
      #parses html link in Nokogiri.
      #doc.css(".post").each do |post|
      #  course = Course.new
      #  course.title = post.css("h2").text
      #  course.schedule = post.css(".date").text
      #  course.description = post.css("p").text
      #  binding.pry
      #end
    end

    def get_courses
      self.get_page.css(".post")
      #reads the css and xml of what is returned by get_page
    end

    def make_courses
        self.get_courses.each do |post|
          #split the page into posts
        course = Course.new
        course.title = post.css("h2").text
        #takes the second header makes it the title
        course.schedule = post.css(".date").text
        #takes everything between the <date> and </date> and makes it a the schedule attribute
        course.description = post.css("p").text
        #takes everything between the <p> and </p> and makes it a description attribute.
        end
    end

    def print_courses
      binding.pry
      self.make_courses
      Course.all.each do |course|
        if course.title
          puts "Title: #{course.title}"
          #puts the title attribute in a string.
          puts "  Schedule: #{course.schedule}"
          #puts the schedule in a string.
          puts "  Description: #{course.description}"
          #puts the description attribute in a string.
        end
      end
    end
end

Scraper.new.print_courses #this is calling the method on a new instance of Scraper class

#ruby lib/scraper.rb how to run ruby on the rb file
#doc how to see xcode
#rspec spec/scraper_spec.rb how to run test
#binding.pry everything to see how they work.
#next blog pry everything
