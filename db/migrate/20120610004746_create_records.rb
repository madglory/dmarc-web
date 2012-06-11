class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string  :source_ip
      t.integer :count
      t.text    :auth_results
      t.text    :policy_evaluated
      t.text    :identifiers
      t.references :report
      t.timestamps
    end
  end
end
