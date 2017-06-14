class AddVisitorsToLink < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :visitor, :integer, array: true, default: []
  end
end
