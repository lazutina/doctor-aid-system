class LocalizationsController < ApplicationController
  include LocalizationsHelper
  include SessionsHelper

  def set_lang
    locale = params[:lang]
    store_location params[:return_to]
    change_locale locale
    redirect_back_or   root_path
  end

end
