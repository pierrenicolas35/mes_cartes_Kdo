-- Table des cartes
CREATE TABLE cartes (
  id VARCHAR(50) PRIMARY KEY,
  nom VARCHAR(255) NOT NULL,
  montant_initial NUMERIC(10, 2) NOT NULL,
  solde_restant NUMERIC(10, 2) NOT NULL,
  donnees_code TEXT NOT NULL,
  statut BOOLEAN NOT NULL DEFAULT TRUE,
  date_validite DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Table de l'historique
CREATE TABLE historique (
  id SERIAL PRIMARY KEY,
  nom_carte VARCHAR(255) NOT NULL,
  action VARCHAR(50) NOT NULL,
  montant NUMERIC(10, 2) NOT NULL,
  utilisateur VARCHAR(255) NOT NULL,
  date TIMESTAMP WITH TIME ZONE NOT NULL
);

-- Activation de la Row Level Security (RLS)
ALTER TABLE cartes ENABLE ROW LEVEL SECURITY;
ALTER TABLE historique ENABLE ROW LEVEL SECURITY;

-- Création des politiques pour autoriser l'accès aux utilisateurs authentifiés
CREATE POLICY "Les utilisateurs authentifiés peuvent tout faire sur les cartes"
ON cartes
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);

CREATE POLICY "Les utilisateurs authentifiés peuvent tout faire sur l'historique"
ON historique
FOR ALL
TO authenticated
USING (true)
WITH CHECK (true);
