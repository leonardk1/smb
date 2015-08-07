# A sample Guardfile
# More info at https://github.com/guard/guard#readme

## Uncomment and set this to only include directories you want to watch
# directories %w(app lib config test spec features) \
#  .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

## Note: if you are using the `directories` clause above and you are not
## watching the project directory ('.'), then you will want to move
## the Guardfile to a watched dir and symlink it back, e.g.
#
#  $ mkdir config
#  $ mv Guardfile config/
#  $ ln -s config/Guardfile .
#
# and, you'll have to watch "config/Guardfile" instead of "Guardfile"
# Defines the matching rules for Guard.

# guard :minitest, spring: true, all_on_start: false do
#  watch(%r{^test/(.*)/?(.*)_test\.rb$})
#  watch('test/test_helper.rb') { 'test' }
#  watch('config/routes.rb')    { integration_tests }
#  watch(%r{^app/models/(.*?)\.rb$}) do |matches|
#    "test/models/#{matches[1]}_test.rb"
#  end
#  watch(%r{^app/controllers/(.*?)_controller\.rb$}) do |matches|
#    resource_tests(matches[1])
#  end
# watch(%r{^app/views/([^/]*?)/.*\.html\.erb$}) do |matches|
#   ["test/controllers/#{matches[1]}_controller_test.rb"] +
#   integration_tests(matches[1])
# end
# watch(%r{^app/helpers/(.*?)_helper\.rb$}) do |matches|
#   integration_tests(matches[1])
# end
#  watch('app/views/layouts/application.html.erb') do
#   'test/integration/site_layout_test.rb'  end
#  watch('app/helpers/sessions_helper.rb') do
#   integration_tests << 'test/helpers/sessions_helper_test.rb'
# end
# watch('app/controllers/sessions_controller.rb') do
#   ['test/controllers/sessions_controller_test.rb',
#    'test/integration/users_login_test.rb']
# end
# watch('app/controllers/account_activations_controller.rb') do
#   'test/integration/users_signup_test.rb'
# end
# watch(%r{app/views/users/*}) do
#   resource_tests('users') +
#   ['test/integration/microposts_interface_test.rb']
# end
# end

guard :rspec, cmd: 'spring rspec' do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
end
