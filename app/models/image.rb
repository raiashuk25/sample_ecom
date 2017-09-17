class Image < ApplicationRecord
  #belongs_to :user
  #belongs_to :product
  belongs_to :entity, polymorphic: true, optional: true
  has_attached_file :photo, styles: {medium:"300*300>",small:"200*200>", thumb: "100*100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
