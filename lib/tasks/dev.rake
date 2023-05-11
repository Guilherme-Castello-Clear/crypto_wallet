namespace :dev do
  
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando DB...") do
        %x(rails db:drop)
      end

      show_spinner("Apagando DB...") do
        %x(rails db:create)
      end    
      
      show_spinner("Apagando DB...") do
        %x(rails db:migrate)
      end

      show_spinner("Apagando DB...") do
        %x(rails db:seed)
      end
    else
      puts "Não estpa em ambiente de desenvolvimento"
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
