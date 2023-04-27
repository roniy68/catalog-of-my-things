require_relative './author'
require_relative './validator'

class Authors
  include Validator
  attr_accessor :authorslist

  def initialize
    @authorslist = []
  end

  def create_author(item)
    print "Add author First Name: \n"
    first_name = validate_empty('First Name')
    print "Add author Last Name: \n"
    last_name = validate_empty('Last Name')
    add_author(item, capitalize_text(first_name), capitalize_text(last_name))
  end

  def add_author(item, first_name, last_name)
    existing_author =
      @authorslist.find do |author|
        author.first_name.downcase == first_name.downcase &&
          author.last_name.downcase == last_name.downcase
      end
    if existing_author
      existing_author.add_item(item)
    else
      new_author = Author.new(first_name, last_name)
      new_author.add_item(item)
      @authorslist << new_author
    end
  end
end
