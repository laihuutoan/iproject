Geocoder.configure(
  ip_lookup: :geoip2,
  geoip2: {
    file: "./data/GeoLite2-City.mmdb"
  }
)
