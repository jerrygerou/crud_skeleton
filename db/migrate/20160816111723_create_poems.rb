class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.string  :title, { default: "Untitled" }
      t.string  :author, { default: "Anonymous" }
      t.text    :body, { null: false }
      t.integer :applauses, { default: 0 }

      t.timestamps(null: false)
    end
  end
end
