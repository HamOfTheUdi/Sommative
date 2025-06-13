# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_06_11_143932) do
  create_table "employes", force: :cascade do |t|
    t.string "nom"
    t.string "specialite"
    t.integer "garage_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_employes_on_garage_id"
  end

  create_table "garages", force: :cascade do |t|
    t.string "nom"
    t.string "adresse"
    t.integer "capacite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "nom"
    t.decimal "prix"
    t.integer "stock"
    t.integer "voiture_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["voiture_id"], name: "index_parts_on_voiture_id"
  end

  create_table "proprietaires", force: :cascade do |t|
    t.string "nom"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.date "date"
    t.string "type_service"
    t.decimal "cout"
    t.integer "voiture_id", null: false
    t.integer "employe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employe_id"], name: "index_services_on_employe_id"
    t.index ["voiture_id"], name: "index_services_on_voiture_id"
  end

  create_table "voitures", force: :cascade do |t|
    t.string "numero_immatriculation"
    t.string "couleur"
    t.string "statut"
    t.integer "annee"
    t.string "marque"
    t.integer "garage_id", null: false
    t.integer "proprietaire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garage_id"], name: "index_voitures_on_garage_id"
    t.index ["numero_immatriculation"], name: "index_voitures_on_numero_immatriculation", unique: true
    t.index ["proprietaire_id"], name: "index_voitures_on_proprietaire_id"
  end

  add_foreign_key "employes", "garages"
  add_foreign_key "parts", "voitures"
  add_foreign_key "services", "employes"
  add_foreign_key "services", "voitures"
  add_foreign_key "voitures", "garages"
  add_foreign_key "voitures", "proprietaires"
end
