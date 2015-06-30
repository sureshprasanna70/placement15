class CompaniesAddStartsAt < ActiveRecord::Migration
  def change
    add_column :companies,:starts_at,:datetime
  end
end
