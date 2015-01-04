class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|

      t.timestamps
    end
  end
end
