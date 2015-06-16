class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000

    add_test_data!
  end

  def add_test_data!
    add_contact("Fakey", "McFAkerson", "real@email.email", "Super real")
  end

  def add_contact(first_name, last_name, email, notes)
    contact = Contact.new(@id, first_name, last_name, email, notes)
    @contacts << contact
    @id += 1
  end
end