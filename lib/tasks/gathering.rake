namespace :gathering do
  desc "TODO"
  task get_coupons: :environment do
    Provider.all.each do |p|
      agg = Aggregator.new p
      agg.get_coupons
    end
  end

end
