import os
from supabase import Client, create_client

SUPABASE_URL = "https://ebsoevyqtduvqxqdulsn.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVic29ldnlxdGR1dnF4cWR1bHNuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQxNTM3OTQsImV4cCI6MjA3OTcyOTc5NH0.4GZhs2yXcph7gvBo0NFg_8RCG-JUGrfrK6fsmby9SeE"


supabase_client: Client = create_client(SUPABASE_URL, SUPABASE_KEY)
