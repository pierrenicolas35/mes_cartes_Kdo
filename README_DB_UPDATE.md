# Database Update

The logo URLs for the brands in the `enseignes` table were pointing to Wikimedia thumbnail endpoints which were returning 400 Bad Request errors. The issue has been fixed by running an SQL UPDATE script to modify the URLs directly in the Supabase database to point to the correct, functional non-thumbnail Wikimedia resources.
