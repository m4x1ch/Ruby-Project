class WorkController < ApplicationController

  def index
    @themes = Theme.all

    if params[:theme_id].present?
      @selected_theme = Theme.find(params[:theme_id])
      @images = @selected_theme.images
      @current_image = @images.first
      @average_value =
  @current_image.values.average(:value)&.round(2) || 0

@my_value =
  current_user&.values
    &.find_by(image: @current_image)
    &.value
    else
      @selected_theme = nil
      @images = []
    end
  end

end