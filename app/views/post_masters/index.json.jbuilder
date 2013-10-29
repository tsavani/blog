json.array!(@post_masters) do |post_master|
  json.extract! post_master, :post_name, :discription, :blog_master_id
  json.url post_master_url(post_master, format: :json)
end
