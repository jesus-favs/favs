class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.column :post_id, :integer
      t.column :mail, :string
    end
  end

  def self.down
    drop_table :votes
  end
end
