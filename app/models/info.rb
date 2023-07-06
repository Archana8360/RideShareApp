

class Info < ApplicationRecord



    has_one :user
    has_one_attached :image, :dependent => :destroy
    def send_passcode
        response = TwoFactor.send_passcode(phone_no)
        
        if response['Status'].downcase == 'success'
          update_column(:session_key, response['Details'])
          return true
        end
    end


    def verify_passcode(passcode)
        TwoFactor.verify_passcode(session_key, passcode)['Status'].downcase == 'success'
    end



end
