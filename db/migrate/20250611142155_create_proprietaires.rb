class CreateProprietaires < ActiveRecord::Migration[8.0]
  def change
    create_table :proprietaires do |t|
      t.string :nom
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
