class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
    	t.string :trigger
      t.string :action

      t.timestamps
    end
  end
end
