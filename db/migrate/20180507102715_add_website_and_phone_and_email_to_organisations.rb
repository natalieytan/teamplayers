  class AddWebsiteAndPhoneAndEmailToOrganisations < ActiveRecord::Migration[5.1]
  def change
    add_column :organisations, :website, :string
    add_column :organisations, :phone, :string
    add_column :organisations, :email, :string
  end
end
