class CreateDkimAuthResults < ActiveRecord::Migration
  def change
    create_table :dkim_auth_results do |t|

      t.timestamps
    end
  end
end
