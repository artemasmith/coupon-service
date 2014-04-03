class Aggregator
  require 'uri'
  require 'net/http'

  def self.build_query(uri, args)
    url = URI.parse(uri)
    url.query = URI.encode_www_form(args)
    url
  end


  def self.get_data(url, parser)
    puts 'getting coupons'
    result = Net::HTTP.get_response(url)
    result = Net::HTTP.get_response(URI.parse(result.header['location'])).body if result.code == '301'
    result = parser.parse(result)
  end

  def self.get_coupons provider, query = nil
    parser = (provider.id == 1)? GdeslonProvider.new(key: provider.key, query: query) : AdmitadProvider.new()
    url = self.build_query(provider.uri, parser.args)
    coupons = self.get_data(url, parser)
    coupons.each { |c| Coupon.create(c) }
  end

end