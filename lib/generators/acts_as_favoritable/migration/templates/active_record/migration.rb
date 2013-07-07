class ActsAsFavoritableMigration < ActiveRecord::Migration
  def change
    create_table :favorites, :force => true do |t|
      t.references :favoritable, :polymorphic => true, :null => false, index: true
      t.references :favoriter, :polymorphic => true, :null => false, index: true

      t.timestamps
    end
  end
end
