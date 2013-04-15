class CreateFeeds < ActiveRecord::Migration
  def up
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.string :etag
      t.text :description
      t.string :feed_url
      t.datetime :last_modified
      t.timestamps
    end

    create_table :entries do |t|
      t.references :feed
      t.string :url
      t.datetime :published
      t.string :summary
      t.string :title
      t.string :entry_id
    end
  end

  def down
    drop_table :entries
    drop_table :feeds
  end
end
