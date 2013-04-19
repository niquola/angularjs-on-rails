class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :project
      t.string :title
      t.string :tracker
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
