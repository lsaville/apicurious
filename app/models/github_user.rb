class GithubUser
  attr_reader :image, :name, :login, :company, :location, :email, :blog, :joined

  def initialize(attributes={})
    @image    = attributes[:avatar_url]
    @name     = attributes[:name]
    @login    = attributes[:login]
    @company  = attributes[:company]
    @location = attributes[:location]
    @email    = attributes[:email]
    @blog     = attributes[:blog]
    @joined   = attributes[:created_at]
  end
  
  def self.get_user_data(token)
    data = GithubService.new(token).user_data
    GithubUser.new(data)
  end
end
