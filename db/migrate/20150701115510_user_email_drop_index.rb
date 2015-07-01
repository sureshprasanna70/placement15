class UserEmailDropIndex < ActiveRecord::Migration
  def change
    ActiveRecord::Base.connection.execute("DROP INDEX index_users_on_email ON users")
  end
end
