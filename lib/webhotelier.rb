require 'webhotelier/version'

require 'active_support'
require 'active_support/core_ext'
require 'faraday'
require 'faraday_middleware'
require 'json'
require 'virtus'

require 'webhotelier/hash_converter'
require 'webhotelier/client'
require 'webhotelier/reservation'

module Webhotelier
  # Your code goes here...
  DEFAULT_CA_BUNDLE_PATH = File.dirname(__FILE__) + '/data'
  def self.client(username:, password:)
    Client.new(username: username, password: password)
  end
end
