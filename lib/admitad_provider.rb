class AdmitadProvider

  require 'base64'

  def initialize provider, query = nil
    @provider = provider
    @key = provider.key
    @query = query
  end

  # servicespecific authentification!!!!!!
  def authenticate
    url = URI.parse('https://api.admitad.com/token/')
    url.query = URI.encode_www_form(scope: 'public_data coupons coupons_for_website',
                                    grant_type: 'client_credentials', client_id: @key.split(':')[0])
    response = RestClient::Request.new(
        :method => :post,
        :url => url.to_s,
        :user => @key.split(':')[0],
        :password => @key.split(':')[1],
        :headers => { :accept => :json,
                      :content_type => :json }
    ).execute
    result = JSON.parse(response)['access_token']
  end

  def build_query
    url = URI.parse(@provider.uri)
    send_params = []
    @provider.categories.each { |c| send_params << { category: c.name} }
    url.query = URI.encode_www_form(send_params)
    url
  end

  def get_data
    auth = 'Bearer ' + self.authenticate
    resource = RestClient::Resource.new(self.build_query.to_s,  { :headers => { 'Authorization' => auth } })
    result = resource.get(:content_type => :json, :accept => :json)
    self.parse(result)
  end

  def parse coupons
    result = []
    coupons = JSON.parse(coupons)['results']
    coupons.each do |coupon|
      cp = { out_id: coupon['id'].to_s, provider_id: @provider.id }
      cp[:available] = coupon['status'].match(/active/) ? true : false
      cp[:name] = coupon['short_name']
      cp[:url] = coupon['image']
      cp[:description] = coupon['description']
      cp[:img] = coupon['image']
      cat = Category.find_by_cid(coupon['categories'][0]['id'].to_s)
      cat = Category.create(name: coupon['categories'][0]['name'], cid: coupon['categories'][0]['id'].to_s) if !cat
      cp[:category_id] = cat.id
      result << cp
    end
    result
  end
end