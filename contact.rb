class Contact

  attr_accessor :id, :first_name, :last_name, :email, :notes


  def initialize(first_name, last_name, email, notes)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update(first_name, last_name, email, notes)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end
end

