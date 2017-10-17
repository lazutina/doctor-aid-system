module LocalizationsHelper
  def current_locale()
    session[:locale]
  end

  def change_locale(locale)
    if locale
      if I18n.available_locales.include?(locale.to_sym)
        I18n.locale = locale
        session[:locale] = @languages.find{|lang| lang[:name] == "#{I18n.locale}"}
      else
        I18n.locale = @languages[0][:name]
        session[:locale] = @languages[0]
      end
    end
  end

  def set_locale
    if !session[:locale]
      I18n.locale = @languages[0][:name]
      session[:locale] = @languages[0]
    else
      I18n.locale = session[:locale]['name']
    end
  end
end
