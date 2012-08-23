# Nesta::Plugin::Sharethis

### [Documentation](http://jmervine.github.com/nesta-plugin-sharethis/doc/) | [NestaCMS](http://nestacms.com/)

Add ShareThis to NestaCMS.

> Warning, this shouldn't be considered tested or final 
> until a gem has been pushed to rubygems.org.


## Installation

Add this line to your application's Gemfile:

    gem 'nesta-plugin-sharethis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nesta-plugin-sharethis

## Usage

1. Add share this configs.

        # file: config/config.yml
        sharethis: SHARETHIS_PARTENT_ID

        sharethis_buttons: # optional
        - :twitter
        - :linkedin
        - :reddit
        - :digg
        - :facebook_like
        # the aboce are the defaults

> IMPORTANT: Notice the above sharethis_buttons are all Symbols
> -- meaning, they start with a colon (:) -- which is required.
>
> See lib/nesta-plugin-sharethis/sharethis.yml for a full list.
> 
> If you would like to add more, fork, add and submit a pull request.


2. Add the 'sharethis_javascript' helper to your your layout.haml:

        -#- file: views/layout.haml
        <!DOCTYPE html>
         %html(lang="en")
          %head
            %meta(charset="utf-8")
            - if @description
              %meta(name="description" content=@description)
            - if @keywords
              %meta(name="keywords" content=@keywords)
            = sharethis_javascript
            %title= @title

        -#- ... rest of layout.haml ...


3. Add the 'sharethis_buttons' helper to your layout, where you want
   your buttons to appear.

        -#- file: views/layout.haml

        -#- ... rest of layout.haml ...
        = sharethis_buttons
        -#- ... rest of layout.haml ...


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
