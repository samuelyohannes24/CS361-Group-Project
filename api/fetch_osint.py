import requests
import psycopg2
import os

# API Keys (Replace with actual keys or use environment variables)
SHODAN_API_KEY = os.getenv("SHODAN_API_KEY", "your_shodan_api_key")
IP = "8.8.8.8"

# Database Connection Settings
DB_NAME = os.getenv("DB_NAME", "threat_intel")
DB_USER = os.getenv("DB_USER", "admin")
DB_PASSWORD = os.getenv("DB_PASSWORD", "securepass")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")

def fetch_shodan_data(ip):
    """Fetch threat data from Shodan API"""
    url = f"https://api.shodan.io/shodan/host/{ip}?key={SHODAN_API_KEY}"
    try:
        response = requests.get(url)
        response.raise_for_status()
        return response.json()
    except requests.RequestException as e:
        print("Error fetching data from Shodan:", e)
        return None

def store_threat_data(asset_id, threat_name, vulnerability_desc, likelihood, impact):
    """Store threat data in the database"""
    try:
        conn = psycopg2.connect(
            dbname=DB_NAME, user=DB_USER, password=DB_PASSWORD,
            host=DB_HOST, port=DB_PORT
        )
        cursor = conn.cursor()
        
        query = """
        INSERT INTO tva_mapping (asset_id, threat_name, vulnerability_description, likelihood, impact)
        VALUES (%s, %s, %s, %s, %s)
        """
        cursor.execute(query, (asset_id, threat_name, vulnerability_desc, likelihood, impact))
        conn.commit()
        cursor.close()
        conn.close()
        print("Threat data successfully stored.")
    except psycopg2.DatabaseError as e:
        print("Database error:", e)
    except Exception as e:
        print("Unexpected error:", e)

# Fetch and store data
data = fetch_shodan_data(IP)
if data and "ports" in data:
    store_threat_data(1, "Exposed Ports", "Open ports detected on system", 4, 5)
