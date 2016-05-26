class AddThumbnailUrlToActor < ActiveRecord::Migration
  def change
    add_column :actors, :thumbnail_url, :string
  end
end
