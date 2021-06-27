class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.text :location
      t.float :salary
      t.string :role
      t.text :skills

      t.timestamps
    end
  end
end
