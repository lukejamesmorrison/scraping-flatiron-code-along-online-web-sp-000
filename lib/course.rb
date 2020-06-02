
class Course

  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
  end

  def self.all
    @@all
  end


end
