class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include LocalizationsHelper
  include SessionsHelper

  protect_from_forgery with: :exception
  before_action :set_menus_langs
  before_action :set_locale

  private
  def set_menus_langs
    @menus = [
        {:displayName => ".home", :url => home_path, :icon => "fa fa-dashboard fa-fw", :visible => true },
        {:displayName => ".user", :url => users_path, :icon => "fa fa-user fa-fw", :visible => true },
        {:displayName => ".product", :url => products_path, :icon => "fa fa-user fa-fw", :visible => true },
    ];

    @languages = [
        {:displayName => "English", :name => "en", :url => lang_path(:lang=> "en"), :icon => "famfamfam-flag-england" },
        {:displayName => "English", :name => "es", :url => lang_path(:lang=> "es"), :icon => "famfamfam-flag-england" },
    ];
  end
end
