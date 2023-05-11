# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando moedas..."

Coin.create!(
    description: 'bitcoin',
    acronym: 'BTC',
    url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/640px-Bitcoin.svg.png'
)

Coin.create!(
    description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://1000logos.net/wp-content/uploads/2023/01/Ethereum-logo.png'
)

Coin.create!(
    description: 'Dash',
    acronym: 'DASH',
    url_image: 'https://media.dash.org/wp-content/uploads/dash-d.png'
)

puts "Moedas cadastradas com sucesso!"