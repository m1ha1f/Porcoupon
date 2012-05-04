class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery

  after_filter :set_access_control_headers

	def set_access_control_headers
		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'SOAPAction'	
	end
end
