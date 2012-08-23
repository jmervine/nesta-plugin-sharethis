module Nesta
  module Plugin
    module Sharethis
      # Load yaml file with share this mappings.
      BUTTONS = load_sharethis_config

      def self.load_sharethis_config
        default   = YAML.load_file( File.expand_path( "sharethis.yml", File.dirname(__FILE__)) )

        override_file = File.expand_path( "config/sharethis.yml", Nesta::Env.root )
        override  = ( File.exists?(override_file) ? YAML.load_file(override_file) : {} )

        default.merge(override)
      end
      private_instance_method :load_sharethis_config

      module Helpers
        def sharethis_javascript
          %{
          <script type="text/javascript">var switchTo5x=true;</script>
          <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
          <script type="text/javascript">stLight.options({publisher: "#{Nesta::Config.sharethis}"}); </script>
          }
        end

        def sharethis_buttons
          buttons = []
          STDOUT.puts Nesta::Config.sharethis_buttons.inspect
          Nesta::Config.sharethis_buttons.each do |button|
            buttons << Nesta::Plugin::Sharethis::BUTTONS[button]
          end
          buttons.join("\n")
        end
      end

    end
  end

  class App
    helpers Nesta::Plugin::Sharethis::Helpers
  end

  class Config
    @settings += %w[ sharethis sharethis_buttons ]

    def self.sharethis_buttons
      from_yaml("sharethis_buttons") || default_buttons
    end

    def self.default_buttons
      %w[
        twitter
        linkedin
        reddit
        facebook_like
      ]
    end
    private_class_method :default_buttons
  end
end

