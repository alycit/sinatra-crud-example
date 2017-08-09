class CreateSchema < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.string :description, null: false
    end
  end
end
