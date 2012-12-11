class Github::User
  include Her::Model
  uses_api $github

  def self.token code
    post_raw("https://github.com/login/oauth/access_token",
             :client_id => "3ec34cfe2117b84317ae", #will hv to move it to config yaml
             :client_secret => "11ef9acb9d4fc94c3c787d697f4b53e383ec2a6c",
             :code => code,
             :state => "random123456"
    ) do |parsed_data|
      return parsed_data[:data][:access_token]
    end
  end

  def self.me token
     get("user", :access_token => token)
  end
end