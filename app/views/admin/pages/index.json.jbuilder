json.pages @pages do |page|
  json.id           page.id
  json.slug         page.slug
  json.title        page.title
  json.created_at   page.created_at
end
