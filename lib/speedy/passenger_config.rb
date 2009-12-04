module Speedy

  class PassengerConfig

    def self.run!
      system 'sudo touch /etc/apache2/passenger_speedy.config'
      system 'sudo vim /etc/apache2/passenger_speedy.config'
      File.open('/etc/apache2/apache2.conf', 'a') do |file|
        file.puts "\n# Include passenger configuration file"
        file.puts "Include passenger_speedy.config"
      end
      system 'sudo /etc/init.d/apache2 restart'
    end

  end

end

