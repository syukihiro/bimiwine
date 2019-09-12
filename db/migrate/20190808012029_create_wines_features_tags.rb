class CreateWinesFeaturesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :wines_features_tags do |t|
      t.integer :wine_id
      t.integer :feature_id

      t.timestamps
    end
  end
end
