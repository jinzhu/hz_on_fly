class User < ActiveRecord::Base
  hz_on_fly :name, :type => :h2z
  hz_on_fly :age, :type => :z2h
end
