json.array!(@blog_masters) do |blog_master|
  json.extract! blog_master, :blog_name, :discription, :user_id
  json.url blog_master_url(blog_master, format: :json)
end
