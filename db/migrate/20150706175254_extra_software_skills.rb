class ExtraSoftwareSkills < ActiveRecord::Migration
  def change
    add_column :extra_activities,:software_skills,:text
  end
end
