class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.boolean :remote
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
