
class TwoFactor
  

  TWO_FACTOR_API_KEY = '6835a1f8-f2ea-11ed-addf-0200cd936042'
      
        def self.send_passcode(phone)
          response = Faraday.get("https://2factor.in/API/V1/#{TWO_FACTOR_API_KEY}/SMS/#{phone}/AUTOGEN/OTP1")
          
          return response
          # response = get("https://2factor.in/API/V1/#{TWO_FACTOR_API_KEY}/SMS/#{phone}")
          # response.parsed_response
        end

  # def self.verify_passcode(session_key, code)
  #   response = post("https://2factor.in/API/V1/#{TWO_FACTOR_API_KEY}/SMS/VERIFY/#{session_key}/#{code}")
  #   response.parsed_response
  # end
end