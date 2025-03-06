
import shodan

API_KEY = 'SHODAN_API_KEY' #where we would insert API key
api = shodan.Shodan(API_KEY) #activating shodan
ip_address = '8.8.8.8'  # Replace with the IP address you want to search for, similar to IP given in example on handout
ip_info = get_ip_info(ip_address) #calling function to grab ip address
print("IP Information:")
print(ip_info) #print to screen

---
#for haveibeenpwned, the most likely to be used would be from the assingment handout
curl -H "hibp-api-key: YOUR_API_KEY"
{url to go here}