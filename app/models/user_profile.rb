# require 'elasticsearch/model'

class UserProfile < ApplicationRecord
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  belongs_to :user
  validates_associated :user
  serialize :images, Array
  mount_uploaders :images, ImageUploader
end

# UserProfile.import
#
# @UserProfile = UserProfile.search('foobar').records
