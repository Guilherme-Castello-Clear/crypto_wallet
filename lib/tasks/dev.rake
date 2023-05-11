namespace :dev do
  
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando DB...") { %x(rails db:drop) }
      show_spinner("Criando tabelas...") { %x(rails db:create) } 
      show_spinner("Migrando...") { %x(rails db:migrate) }
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)

    else
      puts "Não estpa em ambiente de desenvolvimento"
    end
  end


  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando moedas... ") do
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
    sleep 0.4
  end
end


desc "Cadastro de tipos de mineração"
task add_mining_types: :environment do
  show_spinner("Cadastrando tipos de mineração...") do
    mining_types = [
      {name: "Proof of Work", acronym: "PoW"},
      {name: "Proof of Stack", acronym: "PoS"},
      {name: "Proof of Capacity", acronym: "PoC"}
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
