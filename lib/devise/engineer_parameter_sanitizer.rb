class Engineer::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[name sex birthday phone_number self_introduction])
  end
end
