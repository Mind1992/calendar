require 'bundler/setup'
Bundler.require(:default, :test)
Dir[File.dirname(_FILE_) + '/../lib/*.rb'].each { |file| require file }