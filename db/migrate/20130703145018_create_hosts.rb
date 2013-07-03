class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :ip_address
      t.string :reputation

      t.timestamps
    end
  end
end
