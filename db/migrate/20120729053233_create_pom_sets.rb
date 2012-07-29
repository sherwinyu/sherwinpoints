class CreatePomSets < ActiveRecord::Migration
  def change
    create_table :pom_sets do |t|
      t.datetime :planned_start
      t.text :planned_description

      t.timestamps
    end
  end
end
