class GdeslonProvider

  def initialize provider, query
    @provider = provider
    @key = provider.key
    @query = query
  end

  def build_query
    categories = []
    @provider.categories.each { |c| categories << c.name}
    categories = categories.join('*')
    send_params = { 'q' => @query, 't' => categories,  'l' => '20', 'p' => '1', '_gs_at' => @key }
    url = URI.parse(@provider.uri)
    url.query = URI.encode_www_form(send_params)
    url
  end

  def get_data
    result = RestClient.get(self.build_query.to_s)
    self.parse(result)
  end

  def parse coupons
    result = []
    coupons = Nokogiri::XML(coupons)
    coupons.xpath('//offer').each do |coupon|
      next if Coupon.find_by_out_id(coupon['id'])
      cp = { out_id: coupon['id'], provider_id: @provider.id }
      cp[:available] = coupon['available'].match(/[Tt]rue/) ? true : false
      cp[:name] = coupon.xpath('name').text
      cp[:price] = coupon.xpath('price').text.to_f
      cp[:url] = coupon.xpath('url').text
      cp[:description] = coupon.xpath('description').text
      cp[:currency] = coupon.xpath('currencyId').text
      cp[:img] = coupon.xpath('original_picture').text
      cat = Category.find_by_cid(coupon['gs_category_id'])
      cat = Category.create(name: coupon['gs_category_id'], cid: coupon['gs_category_id']) if !cat
      cp[:category_id] = cat.id
      result << cp
      end
    result
  end

end