class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :url
      t.string :language
      t.string :owner
      t.text :description

      t.timestamps
    end
  end
end
