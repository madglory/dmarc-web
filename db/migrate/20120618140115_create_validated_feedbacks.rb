class CreateValidatedFeedbacks < ActiveRecord::Migration
  def change
    create_table :validated_feedbacks do |t|
      t.string "filename"
      t.text   "content"
      t.text   "results"
      t.timestamps
    end
  end
end
