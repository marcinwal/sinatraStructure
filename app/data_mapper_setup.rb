env = ENV["RACK_ENV"] || 'development'

# require_relative 'models/user'
# require_relative 'models/peep'
# require_relative 'models/comment'


DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
DataMapper.finalize