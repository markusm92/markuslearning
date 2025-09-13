class RemoveContentFromPages < ActiveRecord::Migration[6.1]
  def change
    remove_column :pages, :content, :text
  end
end
