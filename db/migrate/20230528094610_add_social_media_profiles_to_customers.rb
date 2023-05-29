class AddSocialMediaProfilesToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :social_media_profiles, :string
  end
end
