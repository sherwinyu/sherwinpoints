class CreatePoms < ActiveRecord::Migration
  def change
    create_table :poms do |t|
      t.datetime :start
      t.datetime :end
      t.string :description
      t.boolean :realtime
      t.boolean :successful
      t.integer :pom_set_id

      t.timestamps
    end
  end
end
