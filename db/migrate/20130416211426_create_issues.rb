class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.string :tracker
      t.text :description

      t.timestamps
    end
  end
end
