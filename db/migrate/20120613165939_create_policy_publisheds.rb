class CreatePolicyPublisheds < ActiveRecord::Migration
  def change
    create_table :policy_publisheds do |t|

      t.timestamps
    end
  end
end
