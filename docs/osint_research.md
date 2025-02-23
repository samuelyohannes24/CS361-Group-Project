Tom: 'Have I been Pwed' and 'VirusTotal '
**VirusTotal API Integration**


**VirusTotal** ![image](https://github.com/user-attachments/assets/5303c736-ea02-4aa3-acd2-bf35b4d19879)

-VirusTotal can be integrated using an API key, which can be obtained by creating an account at https://www.virustotal.com/gui/join.

Searching method:

**API Authentication **

All API requests require an API key. You can authenticate using either of the following headers:
    Authorization: Bearer YOUR_API_KEY
    x-apikey: YOUR_API_KEY

 File Scanning & Reports
    Uploading and Scanning a File Code:
    **POST** /files
    -> Uploads a file for malware scanning.
    
Get File Analysis Report
    Getting File Scan Report Code:
    **GET** /files/{id}
    -> Retrieves the analysis results for a specific file.

URL Scanning & Reports
    Submitting a URL for Scanning Code:
    **POST** /urls
    -> Submits a URL for scanning and analysis.

Get URL Analysis Report
    Getting URL Scan Report Code:
    **GET** /urls/{url_id}
    -> Retrieves the latest scan results of a URL.

Domain and IP Address Analysis
    Retrieving Domain Report
    **GET** /domains/{domain}
    ->Fetches information about a domain, including reputation and security analysis.

Retrieving IP Address Report
    **GET** /ip_addresses/{ip}
    ->Provides security insights about a given IP address.


![image](https://github.com/user-attachments/assets/d19f96c2-a4db-436e-8ba7-60bd30f13716)











**Shodan**

Shodan can be integrated using an API key which can be obtained by creating a Shodan account at https://account.shodan.io/.

When integrated, Shodan offers a variety of methods which allows searching, on demand scanning, network alerts, notifiers, directory methods, and more.


**Search Methods**

**GET** /shodan/host/{ip}

**GET** /shodan/host/count

**GET** /shodan/host/search

**GET** /shodan/host/search/facets

**GET** /shodan/host/search/filters

**GET** /shodan/host/search/tokens


**On-Demand Scanning**

**GET** /shodan/ports

**GET** /shodan/protocols

**POST** /shodan/scan

**POST** /shodan/scan/internet

**GET** /shodan/scans

**GET** /shodan/scan/{id}


**Network Alerts**

**POST** /shodan/alert

**GET** /shodan/alert/{id}/info

**DELETE** /shodan/alert/{id}

**POST** /shodan/alert/{id}

**GET** /shodan/alert/info

**GET** /shodan/alert/triggers

**PUT** /shodan/alert/{id}/trigger/{trigger}

**DELETE** /shodan/alert/{id}/trigger/{trigger}

**PUT** /shodan/alert/{id}/trigger/{trigger}/ignore/{service}

**DELETE** /shodan/alert/{id}/trigger/{trigger}/ignore/{service}

**PUT** /shodan/alert/{id}/notifier/{notifier_id}

**DELETE** /shodan/alert/{id}/notifier/{notifier_id}

**Notifiers**

**GET** /notifier

**GET** /notifier/provider

**POST** /notifier

**DELETE** /notifier/{id}

**GET** /notifier/{id}

**PUT** /notifier/{id}


**Directory Methods**

**GET** /shodan/query

**GET** /shodan/query/search

**GET** /shodan/query/tags


**Bulk Data**  (Enterprise account)

**GET** /shodan/data

**GET** /shodan/data/{dataset}


**Manage Organization** (Enterprise account)

**GET** /org

**PUT** /org/member/{user}

**DELETE** /org/member/{user}


**Account Methods**

**GET** /account/profile


**DNS Methods**

**GET** /dns/domain/{domain}

**GET** /dns/resolve

**GET** /dns/reverse


**Utility Methods**

**GET** /tools/httpheaders

**GET** /tools/myip


**API Status Methods**

**GET** /api-info


**Error Handling**

A non-200 status code in the response indicates an error occurred. Along with a non-200 error code, the error response will also include a message containing the reason for the failure.

Sample Response
{
    "error": "Invalid IP"
}
