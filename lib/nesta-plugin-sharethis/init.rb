module Nesta
  module Plugin
    module Sharethis
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
          Nesta::Config.sharethis_buttons.each do |button|
            buttons << Nesta::Plugin::Sharethis.buttons[button]
          end
          buttons.join("\n")
        end
      end

      # Load yaml file with share this mappings.
      SHARETHIS = YAML.load_file( File.expand_path( "sharethis.yml", File.dirname(__FILE__)) )

      # Access button mappings.
      #
      # @return [Struct] button mappings.
      def self.button
        unless @button
          @button = Struct.new "Button", *(SHARETHIS.keys)
          SHARETHIS.each do |key, val|
            @button.send key, val
          end
        end
        @button
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

