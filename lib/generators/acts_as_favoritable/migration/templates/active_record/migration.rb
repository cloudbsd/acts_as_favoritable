class ActsAsFavoritableMigration < ActiveRecord::Migration
  def change
    create_table :favorites, :force => true do |t|
      t.references :favoritable, :polymorphic => true, :null => false
      t.references :favoriter, :polymorphic => true, :null => false

      t.timestamps
    end
    add_index :favorites, [:favoritable_id, :favoritable_type]
    add_index :favorites, [:favoriter_id, :favoriter_type]
  end
end
