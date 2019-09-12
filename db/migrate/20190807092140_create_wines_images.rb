class CreateWinesImages < ActiveRecord::Migration[5.2]
  def change
    create_table :wines_images do |t|
      t.references :wine, foreign_key: true
      t.string     :images, null: false

      t.timestamps
    end
  end
end
