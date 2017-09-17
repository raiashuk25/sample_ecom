class User < ApplicationRecord
	validates:name, presence:true
	validates:email, presence:true,uniqueness:true
    validates:password,presence:true,on:create
    validates:mobile,presence:true,numericality:true
		has_one:image, as: :entity
		accepts_nested_attributes_for :image
		before_save :encrypt_password
		def encrypt_password
			self.password=Digest::MD5.hexdigest(password)
      self.confirm_password=Digest::MD5.hexdigest(confirm_password)
		end
    def self.db_authenticate(user_cred)
			user_cred["password"]=Digest::MD5.hexdigest(user_cred["password"])
    	where(user_cred).last
    end
		before_destroy :take_backup
		def take_backup
			File.open("#{Rails.root}/public/#{self.id}.json", "w"){|foo|foo.write(self.to_json)}
		end
end
