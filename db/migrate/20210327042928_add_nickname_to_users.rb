class AddNicknameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :age, :integer
    add_column :users, :prefecture, :string
    add_column :users, :hobby, :string
    add_column :users, :motto, :string
    add_column :users, :self, :text
  end
end
