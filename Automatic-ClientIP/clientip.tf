#Get Client IP Address
data "http" "clientip" {
  url = "https://ipv4.icanhazip.com/"
}