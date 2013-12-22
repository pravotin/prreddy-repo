case node["platform_family"]
when "rhel"
 default['php']['packages'] = ['php55', 'php55-devel', 'php55-cli', 'php-pear']
end

