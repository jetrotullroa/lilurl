class LinkSerializer < ActiveModel::Serializer  
  attributes :id, :original_link, :short_link, :visit_count, :user_id, :visitor, :created_at, :updated_at
end
