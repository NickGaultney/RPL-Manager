class CreatePrintLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :print_logs do |t|
      t.references :printer, foreign_key: true
      t.string :printer_name
      t.string :file_name
      t.float :filament_weight
      t.float :print_time
      t.float :cost
      t.integer :status

      t.timestamps
    end
  end
end
