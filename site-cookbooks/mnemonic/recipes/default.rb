#
# Cookbook Name:: mnemonic
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
%w[ /var/www/MaaS /var/www/MaaS/static /srv/mnemonic /srv/mnemonic/shared ].each do |path|
    directory path do
      owner      'root'
      group      'root'
      mode       '0755'
      recursive  true
      action     :create
    end
end 

application 'mnemonic' do
  path       '/srv/mnemonic'
  owner      'root'
  group      'root'
  repository 'https://github.com/alexlovelltroy/django-mnemonic.git'
  rollback_on_error false
  revision   'master'
  packages   ['git-core',]

  django do
    packages          ['Django', 'django-storages', 'gunicorn']
    #requirements      'requirements/mkii.txt'
    #settings_template 'settings.py.erb'
    debug             false
    collectstatic     'collectstatic --noinput'
  end

  gunicorn do
    virtualenv        '/srv/mnemonic/shared/env'
    app_module "mnemonic.wsgi"
    port 8080
    environment  "PATH" => "/srv/mnemonic/shared/env/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin"
  end

  nginx_load_balancer do
      application_port 8080
      set_host_header true
      static_files "/static" => "/var/www/MaaS/static/"
  end

end
