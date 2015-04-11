require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.cron '45 * * * *' do
  users = User.select(:id, :email, :encrypted_password).where(role: 1)

  if users.size > 0

    day, month, year, hour = Time.now.day, Time.now.month, Time.now.year, Time.now.hour
    password = "#{year}#{month}#{day}#{hour}#{year + hour}"

    users.each do |user|
      old_password = user.encrypted_password
      user.update_attribute(:password, password)
      if old_password != user.encrypted_password
        puts "Senha do usuário com login #{user.email} foi alterada com sucesso."
      else
        puts "Não foi possível alterar a senha do usuário com login #{user.email}"
      end
    end
  end
end
