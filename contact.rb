class Contact
  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @notes = notes
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_s
    "#{id}: #{full_name} <#{email}> -- Notes: #{notes}"
  end
end
