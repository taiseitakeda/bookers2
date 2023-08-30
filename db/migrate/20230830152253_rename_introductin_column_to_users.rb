class RenameIntroductinColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introductin, :introduction
  end
end
