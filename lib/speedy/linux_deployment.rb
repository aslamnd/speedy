module Speedy

  class LinuxDeployment

    @@site_avaliable_dir_path = File.join('/' 'etc', 'apache2', 'sites-available')
    HOSTS_FILE_PATH = '/etc/hosts'

    attr_accessor :app_name, :touch_file


    def initialize(args=[])
      do_action(ARGV[0])
    end

    def do_action(action)
      case action
      when 'deploy'
        deploy(ARGV[1])
      when 'config-passenger'
        config_passenger
      when '-h'
        display_help
      when '--help'
        display_help
      else
        puts "Not a valid command. Please type 'speedy -h' to view all avaliable commands."
      end
    end # do_action

    def deploy(args)
      construc_app_name(args)
      create_virtual_host
      add_hosts_entry
      enable_site
      conclusion
    end

    # Preform Apache-Passenger clean configuration for Linux
    def config_passenger
      Speedy::PassengerConfig.run!
    end

    # Display all available commands and options
    def display_help
      puts "# sudo speedy config-passenger"
      puts "# sudo speedy deploy"
      puts "# sudo speedy deploy <custom_name>.local"
    end

    # Create virtual host for default name unless the user provide a name
    def create_virtual_host
      apache_touch_file = construct_apache_touch_file
      virtual_host_exists?(apache_touch_file)
      document_root = construct_document_root
      File.open( apache_touch_file, 'w') do |file|
        file.puts "<VirtualHost *:80>\n"
        file.puts "\tServerName #{@app_name}\n"
        file.puts "\tRackEnv development\n"
        file.puts "\tDocumentRoot #{document_root}\n"
        file.puts "</VirtualHost>"
      end
      puts "\n\nVirtual Host for #{@app_name} created.\n"
    end


    # Construct app name
    def construc_app_name(args)
      # If name doesn't provided by user set the default name
      if args.nil?
        @app_name = Dir.pwd.split('/').pop + ".local"
      else
        @app_name = args
      end
    end

    # Construct the application public folder path
    def construct_document_root
      return Dir.pwd + "/public"
    end


    # Contruct the apache touch file removing '.'
    def construct_apache_touch_file
      if @app_name.empty?
        @touch_file = "no_file"
      else
        @touch_file = @app_name.include?('.') ? @app_name.split(".").shift : @app_name
      end
      return File.join(@@site_avaliable_dir_path, touch_file)
    end

    # Check whether a virtual host exists in the same name
    def virtual_host_exists?(host)
      if File.exists?(host)
        separator
        puts "Sorry, but a virtual host in the same name already exist!"
        puts "Please try with a diffrent name."
        puts "[Hint: speedy new_name.local ]"
        separator
        exit!
      end
    end

    # Add the application name to /etc/hosts file
    def add_hosts_entry
      File.open(HOSTS_FILE_PATH, 'a') do |file|
        file.puts "127.0.0.1\t#{@app_name}"
      end
    end

    # Run Apache command to enable the site
    def enable_site
      separator
      system "sudo a2ensite #{@touch_file}"
      separator
      sleep(1)
      system "sudo /etc/init.d/apache2 restart"
    end

    # Display final success message
    def conclusion
      separator
      puts "#{@app_name} successfully deployed! URL: http://#{app_name}"
      puts "\n\n"
    end

    def separator
        puts "-" * 65
    end

  end # LinuxDeployment

end # Speedy

