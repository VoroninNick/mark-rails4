class HabtmOnGroupsProjects < ActiveRecord::Migration
           def self.up
             remove_column :products, :group_id
             
             create_table :groups_products, :id => false do |t|
              t.integer :group_id
              t.integer :product_id
             end
           end

           def self.down
             drop_table :groups_products
           end
end
