class Aggregator

  def initialize provider
    @parser = case provider.name
      when 'gdeslon'
        GdeslonProvider.new  provider, nil
      when 'admitad'
        AdmitadProvider.new provider, nil
    end
  end

  def get_coupons
    coupons = @parser.get_data
    coupons.each { |c| Coupon.create(c) if !Coupon.find_by_out_id(c[:out_id]) }
  end

end