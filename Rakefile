require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

task default: [:spec]

task mytask: :dotenv do
    './lib/sms.rb'
end
