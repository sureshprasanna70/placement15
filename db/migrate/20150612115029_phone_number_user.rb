class PhoneNumberUser < ActiveRecord::Migration
  def change
    add_column :users,:phone,:string,:unique=>true,:limit=>10
  end
end
