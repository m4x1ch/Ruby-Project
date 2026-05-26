class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale

  private

  def set_locale
    I18n.locale =
      params[:locale] || :ru
  end

  def default_url_options
    {
      locale: I18n.locale
    }
  end
end
