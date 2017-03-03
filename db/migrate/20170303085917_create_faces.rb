class CreateFaces < ActiveRecord::Migration[5.0]
  def change
    create_table :faces do |t|
      t.string :img_token
      t.string :img_url
      t.integer :img_id

      t.timestamps
    end
  end
end
