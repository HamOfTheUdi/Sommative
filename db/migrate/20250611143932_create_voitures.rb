class CreateVoitures < ActiveRecord::Migration[8.0]
  def change
    create_table :voitures do |t|
      t.string :numero_immatriculation
      t.string :couleur
      t.string :statut
      t.integer :annee
      t.string :marque
      t.references :garage, null: false, foreign_key: true
      t.references :proprietaire, null: false, foreign_key: true

      t.timestamps
    end
    add_index :voitures, :numero_immatriculation, unique: true
  end
end
