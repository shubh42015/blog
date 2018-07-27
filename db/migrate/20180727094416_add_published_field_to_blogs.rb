class AddPublishedFieldToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :published, :boolean
  end
end
