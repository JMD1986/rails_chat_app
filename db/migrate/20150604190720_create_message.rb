class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :name, null: false
      t.string :room, default: "main"
      t.string :text, limit: 300, null: false
      t.timestamps null: false
      t.boolean :status, default: true
    end
  end
end
