class Staff < ActiveRecord::Base
	has_attached_file :avatar, bucket: 'vitabiotics-assets', styles: {
		thumb: '100x100>',
		square: '200x200#',
		medium: '300x300>'
	}, default_url: ':attachment/missing.png', storage: :s3, url: ":s3_domain_url", path: "/images/:id/:style.:extension",
	s3_host_name: 's3.amazonaws.com', s3_credentials: "#{Rails.root}/config/aws.yml"
	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end