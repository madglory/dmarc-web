class CreateAdminReports < ActiveRecord::Migration
  def change
    create_table :admin_reports do |t|

      t.timestamps
    end
  end
end
