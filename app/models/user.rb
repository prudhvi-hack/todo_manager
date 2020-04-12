class User < ActiveRecord::Base
  has_secure_password
  has_many :todos

  def to_displayable_string
    "name:#{name} gmail:#{gmail} password#{password}"
  end

  def self.add_newuser(newuser)
    first_name = newuser[:first_name]
    last_name = newuser[:last_name]
    email = newuser[:email]
    password = newuser[:password_digest]
    create!(first_name: first_name, last_name: last_name, email: email, password_digest: password)
  end
  def self.check(credentials)
    where("gmail=? and password=?", credentials["email"], credentials["password"]).exists?
  end
end
