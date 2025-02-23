Tom: Shodan and VirusTotal 

**Shodan**
Shodan can be integrated using an API key which can be obtained by creating a Shodan account.
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
