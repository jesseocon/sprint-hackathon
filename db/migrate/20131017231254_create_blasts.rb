class CreateBlasts < ActiveRecord::Migration
  def change
    create_table :blasts do |t|

      t.timestamps
    end
  end
end
