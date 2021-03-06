# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
[
    { name: 'Чемоданы' },
    { name: '3D очки' },
    { name: 'Акустика' },
    { name: 'Аудиокниги' }
].each do |category|
  Category.create(category)
end

Coupon.create(name: 'test', price: 100.0, url: 'http://localhost:3000/')

Provider.create(name: 'gdeslon', uri: 'http://www.gdeslon.ru/api/search.xml', key: 'f4aa7c537cd2d2ead6eb0982148f9307707451e1')
Provider.create(name: 'admitad', uri: 'https://api.admitad.com/coupons/', key: '6c631713703a910ee4871e21f2b9be:d061605adec6106ccf9e2cb3c4058c')