class Post < ActiveRecord::Base
	validates :nombre, :presence => { :message => "Por Favor ingresa un nombre"}

end
