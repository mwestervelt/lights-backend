class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :avatar
end
