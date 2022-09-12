class AddParentIdColumnToTask < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :parent, foreign_key: { to_table: :tasks }
  end
end
