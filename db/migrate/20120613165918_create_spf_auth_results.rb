class CreateSpfAuthResults < ActiveRecord::Migration
  def change
    create_table :spf_auth_results do |t|

      t.timestamps
    end
  end
end
