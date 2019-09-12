class Wines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.references :user, foreign_key: true
      t.string     :name
      t.text       :comment
      t.string     :shop_name

      t.timestamps
    end
  end
end
