class AddColumnToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :read_date, :date
  end
end
