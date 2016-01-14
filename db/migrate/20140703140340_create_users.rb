class CreateUsers < ActiveRecord::Migration
  # Write your migrations here

  def change
    create_table :users do |t|
      t.string :name
      t.integer :height
      t.integer :happiness
      t.integer :tickets
      t.integer :nausea
    end
  end
end
