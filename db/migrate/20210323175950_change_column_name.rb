class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :flights, :when, :date_of_flight
  end
end
