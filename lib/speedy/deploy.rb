module  Speedy

    class Deploy

        require 'rbconfig'

        attr_accessor :platform

        @platform = Config::CONFIG['host_os']

        def self.deploy!
          if @platform.match('linux')
            Speedy::LinuxDeployment.new
          elsif @platform.match('darwin')
            puts "-" * 65 
            puts "Wohooo it's a Mac."
            puts "This version (0.1.0) only supports for Linux."
            puts "-" * 65 
          else
            puts "Sorry, Speedy dosen't support to your Operating System!"
          end

        end


    end # Deploy

end # Speedy

