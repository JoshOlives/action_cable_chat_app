class AddColorToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :color, :string
  end
end
