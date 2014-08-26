class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :number
    end

    add_column :lessons, :section_id, :integer

  end
end
