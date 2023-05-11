# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando moedas...", format: :pulse_2)
spinner.auto_spin

coins = [
    {description: 'bitcoin',
    acronym: 'BTC',
    url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/640px-Bitcoin.svg.png'},
    
    {description: 'Ethereum',
    acronym: 'ETH',
    url_image: 'https://1000logos.net/wp-content/uploads/2023/01/Ethereum-logo.png'},
    
    {description: 'Dash',
    acronym: 'DASH',
    url_image: 'https://media.dash.org/wp-content/uploads/dash-d.png'}
]

coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

sleep(0.4)


spinner.success('Cadastrado com sucesso!')