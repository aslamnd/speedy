module Speedy

  class PassengerConfig

    def self.run!
      if File.exists?('/etc/apache2/passenger_speedy.conf')
        system 'sudo touch /etc/apache2/passenger_speedy.conf'
        system 'sudo vi /etc/apache2/passenger_speedy.conf'
      else
        system 'sudo touch /etc/apache2/passenger_speedy.conf'
        system 'sudo vi /etc/apache2/passenger_speedy.conf'
        File.open('/etc/apache2/apache2.conf', 'a') do |file|
          file.puts "\n# Include passenger configuration file"
          file.puts "Include passenger_speedy.conf"
        end
      end # if
      system 'sudo /etc/init.d/apache2 restart'
    end

  end # PassengerConfig

end # Speedy

