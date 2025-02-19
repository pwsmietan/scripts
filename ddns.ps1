
# Send updated dynamic IP address to Namecheap, in order to update subdomains.
# This uses curl (separate pkg) to send the change; Namecheap automatically detects source IP if the ip field (like domain, password)
# is not specified.

# info helper
function info() { 
	param ($msg)
	write-host "$msg\n"
}

info "Starting IP update for subdomains"

curl "https://dynamicdns.park-your-domain.com/update?host=dev&domain=conceivetech.com&password=71554e6746314b11b65f3e031eef0350"

info "IP update done"
