json.products @products do |product|
  json.id                 product.id
  json.slug               product.slug
  json.image              product.image
  json.name               product.name
  json.description        product.description
  json.code               product.code
  json.price              product.price
  json.sold               product.sold
  json.quantity           product.quantity
  json.featured           product.featured
  json.user               product.user.name
  # json.category           product.category.name
  json.created_at         product.created_at
end
