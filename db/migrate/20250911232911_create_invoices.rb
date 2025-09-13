class CreateInvoices < ActiveRecord::Migration[8.0]
  def change
    create_table :invoices do |t|
      t.references :client, null: false, foreign_key: true
      t.integer :year
      t.integer :month
      t.string :status
      t.string :payment_method_key
      t.text :error_message
      t.integer :metadata_retry_count

      t.timestamps
    end
    add_index :invoices, [ :client_id, :year, :month ], unique: true
  end
end
