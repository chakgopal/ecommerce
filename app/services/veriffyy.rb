module Veriffyy
    def valid_phone_number?(country_code, phone_number)
      response = Authy::PhoneVerification.start(country_code: country_code, phone_number: phone_number)
      response.success?
    end

    def valid_confirmation_code?(code, country_code, phone1)
        response = Authy::PhoneVerification.check(verification_code: code, country_code: country_code, phone_number: phone1)
        response.success?
      end
  end