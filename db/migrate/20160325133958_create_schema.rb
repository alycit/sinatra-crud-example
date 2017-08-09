class CreateSchema < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :username, null: false
      t.string :password_type_thing, null: false
    end
  end
end
