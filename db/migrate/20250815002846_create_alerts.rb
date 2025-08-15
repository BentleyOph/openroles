class CreateAlerts < ActiveRecord::Migration[8.0]
  def change
    create_table :alerts do |t|
      t.string :query
      t.string :email

      t.timestamps
    end
  end
end
