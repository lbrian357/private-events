class CreateAttendanceships < ActiveRecord::Migration[5.0]
  def change
    create_table :attendanceships do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end

    add_index :attendanceships, [:user_id, :event_id]
  end
end
