jss = %w[
netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.js
code.angularjs.org/1.1.4/angular.js
code.angularjs.org/1.1.4/angular-resource.js
raw.github.com/angular-ui/angular-ui/master/build/angular-ui.js
angular-ui.github.com/ui-router/build/angular-ui-states.js
raw.github.com/angular-ui/bootstrap/gh-pages/ui-bootstrap-tpls-0.2.0.js
raw.github.com/angular-ui/bootstrap/gh-pages/ui-bootstrap-0.2.0.js
]

css = %w[
]
archives = %w[
twitter.github.io/bootstrap/assets/bootstrap.zip
]

puts "installing assets"

ASSET_DIR = File.join(File.dirname(__FILE__),'assets')

def load_asset(type, url)
  file_name = File.basename(url)
  puts "curl http://#{url} #{type}/#{file_name}"
  system "curl -L http://#{url} > #{ASSET_DIR}/#{type}/#{file_name}"
end

jss.each do |js|
  load_asset('javascripts', js)
end

css.each do |cs|
  load_asset('stylesheets', cs)
end

archives.each do |url|
  system "mkdir #{ASSET_DIR}/tmp"
  system "curl -L http://#{url} > #{ASSET_DIR}/tmp/arch.zip"
  system "unzip #{ASSET_DIR}/tmp/arch.zip -d #{ASSET_DIR}/tmp/"
  system "ls -la #{ASSET_DIR}/tmp/"
  system "cp #{ASSET_DIR}/tmp/bootstrap/js/*.js #{ASSET_DIR}/javascripts/"
  system "cp #{ASSET_DIR}/tmp/bootstrap/css/*.css #{ASSET_DIR}/stylesheets/"
  system "cp #{ASSET_DIR}/tmp/bootstrap/img/* #{ASSET_DIR}/images/"
  system "rm -rf #{ASSET_DIR}/tmp"
  system "rm -rf #{ASSET_DIR}/arch.zip"
end
