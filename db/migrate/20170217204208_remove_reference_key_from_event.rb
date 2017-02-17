class RemoveReferenceKeyFromEvent < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :events, name: "index_events_on_creator_id"
  end
end
