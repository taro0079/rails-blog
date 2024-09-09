class Article < ApplicationRecord
  belongs_to :admin
  enum status: { draft: 0, published: 1 }
end
