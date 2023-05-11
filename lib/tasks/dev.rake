namespace :dev do
  
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando tabelas...") { %x(rails db:create) } 
      show_spinner("Migrando...") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)

    else
      puts "Não estpa em ambiente de desenvolvimento"
    end
  end


  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas... ") do
      coins = [
        {
          description: 'bitcoin',
          acronym: 'BTC',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/640px-Bitcoin.svg.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        
        {
          description: 'Ethereum',
          acronym: 'ETH',
          url_image: 'https://1000logos.net/wp-content/uploads/2023/01/Ethereum-logo.png',
          mining_type: MiningType.all.sample
        },
        
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://media.dash.org/wp-content/uploads/dash-d.png',
          mining_type: MiningType.all.sample
        }
    ]
    coins.each do |coin|
        Coin.find_or_create_by!(coin)
    end  
    sleep 0.4
  end
end


desc "Cadastro de tipos de mineração"
task add_mining_types: :environment do
  show_spinner("Cadastrando tipos de mineração...") do
    mining_types = [
      {description: "Proof of Work", acronym: "PoW"},
      {description: "Proof of Stack", acronym: "PoS"},
      {description: "Proof of Capacity", acronym: "PoC"}
    ]

    mining_types.each do |mining_type|
      MiningType.find_or_create_by!(mining_type)
    end
    sleep 0.4
  end
end



  private
  def show_spinner(msg_start, msg_end = 'Done!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}", format: :pulse_2)
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")

  end
end
