class Widget
  include ActiveModel::API
  #include ActiveModel::AttributeMethods
  attr_accessor :title
  #define_attribute_methods :title
  validates :title, presence: true
end
