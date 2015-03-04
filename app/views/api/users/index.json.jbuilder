json.users @users do |user|
  json.id           user.id
  json.email        user.email
  json.role         user.role
  json.gender       user.gender
  json.name         user.name
  json.address      user.address
  json.contact1     user.contact1
  json.contact2     user.contact2
  json.doc          user.doc
  json.avatar       user.avatar
  json.description  user.description
  json.created_at   user.created_at
  json.updated_at   user.updated_at
end
