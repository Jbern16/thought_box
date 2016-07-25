class Link < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :url
  validates :url, url: true
end
