class PicUser < ActiveRecord::Migration
  def change
    add_column :users,:pic,:text
  end
end
