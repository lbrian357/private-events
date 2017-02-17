class RemoveCreatorIndexFromEvents < ActiveRecord::Migration[5.0]
  def change
    remove_index :events, name: "index_events_on_creator_id"
  end
end
