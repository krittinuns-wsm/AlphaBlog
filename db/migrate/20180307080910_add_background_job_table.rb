class AddBackgroundJobTable < ActiveRecord::Migration
  def change
     create_table :background_jobs do |t|
      t.string :title
      t.integer :progress
      t.datetime :finished_at

      t.timestamps
    end
  end
end
