class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps

      add_index(:users, :email)
    end
  end
end
