class CreateAuditLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :audit_logs do |t|
      t.references :user, foreign_key: true
      t.references :document, foreign_key: true, null: true
      t.references :beta_reader_invite, foreign_key: true, null: true
      t.integer :action, default: 0
      t.timestamps
    end
  end
end
