class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :description
      t.string :author
      t.datetime :date

      t.timestamps
    end
  end
end
