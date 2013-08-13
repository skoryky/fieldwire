class AddInitialTables < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps
    end

    create_table :floorplans do |t|
      t.belongs_to :project

      t.string :display_name
      t.timestamps
    end

    create_table :blueprints do |t|
      t.belongs_to :floorplan

      t.string :file
      t.timestamps
    end
  end
end
