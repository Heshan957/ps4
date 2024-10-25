import urllib.request
import urllib.parse
import urllib.error
import json

def get_iss_location():
    """Fetch the current location of the ISS from OpenNotify API."""
    url = "http://api.open-notify.org/iss-now.json"
    try:
        # Open the URL and read the response
        with urllib.request.urlopen(url) as response:
            data = response.read()  # Read the response bytes
            # Decode bytes to string and load JSON
            return json.loads(data.decode('utf-8'))  # Parse JSON response
    except urllib.error.URLError as e:
        print(f"Error fetching data: {e.reason}")
        return None

def display_iss_location(iss_data):
    """Display the ISS location as longitude and latitude."""
    if iss_data:
        print("Raw data from API:", iss_data)  # Print the raw data for debugging
        if 'iss_position' in iss_data:
            latitude = iss_data['iss_position']['latitude']
            longitude = iss_data['iss_position']['longitude']
            
            print("Current ISS Location:")
            print(f"Latitude: {latitude}")
            print(f"Longitude: {longitude}")
        else:
            print("No 'iss_position' key found in the data.")
    else:
        print("No ISS data available.")

def main():
    iss_data = get_iss_location()
    display_iss_location(iss_data)

if __name__ == "__main__":
    main()
