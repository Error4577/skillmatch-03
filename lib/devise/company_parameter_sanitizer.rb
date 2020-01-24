class Company::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[name email password phone_number about])
    permit(:account_update, keys: %i[name email phone_number about])
  end
end
