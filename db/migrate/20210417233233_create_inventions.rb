class CreateInventions < ActiveRecord::Migration[5.2]
  def change
    create_table :inventions do |t|
      t.string :title
      t.string :description
      t.string :relevant_field
      t.datetime :date_of_conception
      t.boolean :patent_filed
    end
  end
end
