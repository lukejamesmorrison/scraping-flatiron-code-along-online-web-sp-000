require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open('http://learn-co-curriculum.github.io/site-for-scraping/courses'))
  end

  def get_courses
    get_page.css('.post')
  end

  def make_courses
    courses.each do |course|
      title = course.search('h2').text
      schedule = course.search('em.date').text
      description = course.search('p').text
      Course.new(title, schedule, description)
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end
