class CreateSchema < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.references :user
    end
  end
end
