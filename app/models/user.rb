class User < ActiveRecord::Base
  def to_displayable_string
    "name:#{name} gmail:#{gmail} password#{password}"
  end

  def self.add_newuser(newuser)
    name = newuser[:name]
    email = newuser[:email]
    password = newuser[:password]
    create!(name: name, gmail: email, password: password)
  end
  def self.check(credentials)
    where("gmail=? and password=?", credentials["email"], credentials["password"]).exists?
  end
end
