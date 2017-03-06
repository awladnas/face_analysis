class AddColumnToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :attachment_2, :string
  end
end
