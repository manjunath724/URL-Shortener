class CreateShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :shorteners do |t|
      t.string :main_domain
      t.string :abbrev
      t.text :alt_domain

      t.timestamps
    end
  end
end
