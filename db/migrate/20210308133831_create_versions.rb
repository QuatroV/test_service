class CreateVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :versions do |t|
      t.date :release_date

      t.timestamps
    end
  end
end
