class ApplicationController < ActionController::Base
  protected

  def devise_parameter_sanitizer
    if resource_class == Engineer
      Engineer::ParameterSanitizer.new(Engineer, :engineer, params)
    elsif resource_class == Company
      Company::ParameterSanitizer.new(Company, :company, params)
    else
      super
    end
  end
end
