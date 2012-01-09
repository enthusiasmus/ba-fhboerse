class AddAttachmentPhotoPhotoTwoPhotoThreeToApartment < ActiveRecord::Migration
  def self.up
    add_column :apartments, :photo_file_name, :string
    add_column :apartments, :photo_content_type, :string
    add_column :apartments, :photo_file_size, :integer
    add_column :apartments, :photo_updated_at, :datetime
    add_column :apartments, :photo_two_file_name, :string
    add_column :apartments, :photo_two_content_type, :string
    add_column :apartments, :photo_two_file_size, :integer
    add_column :apartments, :photo_two_updated_at, :datetime
    add_column :apartments, :photo_three_file_name, :string
    add_column :apartments, :photo_three_content_type, :string
    add_column :apartments, :photo_three_file_size, :integer
    add_column :apartments, :photo_three_updated_at, :datetime
  end

  def self.down
    remove_column :apartments, :photo_file_name
    remove_column :apartments, :photo_content_type
    remove_column :apartments, :photo_file_size
    remove_column :apartments, :photo_updated_at
    remove_column :apartments, :photo_two_file_name
    remove_column :apartments, :photo_two_content_type
    remove_column :apartments, :photo_two_file_size
    remove_column :apartments, :photo_two_updated_at
    remove_column :apartments, :photo_three_file_name
    remove_column :apartments, :photo_three_content_type
    remove_column :apartments, :photo_three_file_size
    remove_column :apartments, :photo_three_updated_at
  end
end
