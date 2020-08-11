require "sqlite3"
require "sequel"

class Database
  def self.db_connect
    Sequel.connect('sqlite://database.db')
  end
  
  def self.add_user(user)
    db = Database.db_connect
    db[:users].insert(email: user[:email], first_name: user[:first_name],
                      last_name: user[:last_name], 
                      password: BCrypt::Password.create(user[:password]))
  end
  
  def self.get_user(user)
    db = Database.db_connect
    user = db['SELECT * FROM users WHERE email = ?', user[:email]].first
    puts user
  end
end
