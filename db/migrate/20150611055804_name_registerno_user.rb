class NameRegisternoUser < ActiveRecord::Migration
  def change
    add_column :users,:registerno,:string,limit: 10
    add_column :users,:name,:text
  end
end
