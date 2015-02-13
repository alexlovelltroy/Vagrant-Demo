#
# Cookbook Name:: mnemonic
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
%w[ /var/www/MaaS /var/www/MaaS/static ].each do |path|
    directory path do
      owner      'nobody'
      group      'nogroup'
      mode       '0755'
      recursive  true
      action     :create
    end
end 

application 'mnemonic' do
  path       '/srv/mnemonic'
  owner      'nobody'
  group      'nogroup'
  repository 'https://github.com/alexlovelltroy/django-mnemonic.git'
  revision   'master'
  packages   ['git-core',]

  django do
    packages          ['Django', 'django-storages']
    #requirements      'requirements/mkii.txt'
    #settings_template 'settings.py.erb'
    debug             false
    collectstatic     'collectstatic --noinput'
  end

  nginx_load_balancer do 
      application_port 8080
      set_host_header true
      static_files "/static" => "/var/www/MaaS/static/"
  end

end
