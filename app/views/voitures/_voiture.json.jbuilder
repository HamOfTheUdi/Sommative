json.extract! voiture, :id, :numero_immatriculation, :couleur, :statut, :annee, :marque, :garage_id, :proprietaires_id, :created_at, :updated_at
json.url voiture_url(voiture, format: :json)
