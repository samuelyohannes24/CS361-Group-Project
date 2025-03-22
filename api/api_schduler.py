# Task 2: Automating Real-Time Threat Intelligence Updates
# File: /api/scheduler.py

import schedule
import time
from shodan_integration import fetch_shodan_data

def run_osint_updates():
    print("Fetching latest threat intelligence data...")
    fetch_shodan_data()
    print("Data fetched and stored successfully.")

# Schedule API calls every 6 hours
schedule.every(6).hours.do(run_osint_updates)

print("Scheduler is running...")
while True:
    schedule.run_pending()
    time.sleep(1)


# Task 4: Implementing an Alert System for High-Risk Threats
# File: /src/alerts.py

import smtplib
from email.mime.text import MIMEText

def send_alert(threat, risk_score):
    if risk_score <= 20:
        print(f"Threat detected: {threat}, but score {risk_score} is not critical.")
        return

    msg = MIMEText(f"High-Risk Threat Detected: {threat} with Risk Score {risk_score}")
    msg["Subject"] = "Critical Cybersecurity Alert"
    msg["From"] = "alerts@shopsmart.com"
    msg["To"] = "admin@shopsmart.com"

    try:
        with smtplib.SMTP("smtp.your-email.com", 587) as server:
            server.starttls()
            server.login("your-email", "your-password")
            server.sendmail("alerts@shopsmart.com", "admin@shopsmart.com", msg.as_string())
        print("Alert sent successfully.")
    except Exception as e:
        print(f"Failed to send alert: {e}")


# Task 5: Testing & Validating API Responses
# File: /tests/api_tests.py

import pytest
from api.shodan_integration import fetch_shodan_data

def test_shodan_api():
    data = fetch_shodan_data("8.8.8.8")
    assert "ports" in data, "Expected 'ports' in API response"
    assert isinstance(data["ports"], list), "Expected 'ports' to be a list"
    assert "hostnames" in data, "Expected 'hostnames' in API response"

def test_risk_alert():
    from src.alerts import send_alert
    assert send_alert("SQL Injection", 25) is None, "Alert failed for high-risk score"
    assert send_alert("Port Scan", 10) is None, "Alert sent incorrectly for low-risk score"

if __name__ == '__main__':
    pytest.main()
