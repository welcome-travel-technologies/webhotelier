module Webhotelier
  class Client
    API_BASE = 'https://rest.reserve-online.net'
    attr_reader :username, :password, :conn


    def initialize(username:, password:)
      @username = username
      @password = password
      @conn = Faraday.new(
        url: API_BASE,
        ssl: { ca_path: Webhotelier::DEFAULT_CA_BUNDLE_PATH }
      ) do |b|
        b.headers['Accept'] = 'application/json'
        b.request  :basic_auth, @username, @password
        b.response :logger
        b.response :json
        b.adapter  Faraday.default_adapter
      end
    end

    def invoke(resource, method, options = {})
      constantize("webhotelier/#{resource}").send(
        method,
        options.merge(client: self)
      )
    end

    private

    def constantize(class_name)
      Object.module_eval(class_name.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase })
    end
  end
end
