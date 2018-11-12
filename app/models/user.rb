
has_secure_password




before_save { self.email = email.downcase }

validates :first_name, :presence => true,
                        :length => { :maximum => 25 }
validates :last_name, :presence => true,
                        :length => { :maximum => 50 }
VALID_EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
validates :email, :presence => true,
                    :uniqueness => { case_sensitive: false}, 
                    :length => { :maximum => 100 },
                    :format => { with: VALID_EMAIL_REGEX },
                    :confirmation => true
validates :password, :presence => true,
                    :length => { :within => 6..20 }
validates_confirmation_of :password
validates :avatar, :attachment_presence => true
validates_with AttachmentPresenceValidator, :attributes => :avatar
validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 1.megabytes

scope :sorted, lambda { order("last_name ASC, first_name ASC") }

def name
 "#{first_name} #{last_name}"
end

private