class Person
  attr_accessor :first_name, :last_name

  @@people = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@people << self
  end

  def self.search(last_name)
    @@people.reject { |l_name| l_name.last_name != last_name }
  end

  def to_s
    "First name: #{first_name}, Last name: #{last_name}"
  end
end

p1 = Person.new("John", "Smith")
p2 = Person.new("John", "Doe")
p3 = Person.new("Jane", "Smith")
p4 = Person.new("Cool", "Dude")

puts Person.search("Smith")

# Should print out
# => John Smith
# => Jane Smith
