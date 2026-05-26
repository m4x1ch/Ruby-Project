class Api::ApiController < ApplicationController

    before_action :set_locale

  def next_image

    images =
      Image.where(theme_id: params[:theme_id])

    new_index =
      params[:index].to_i + 1

    new_index = 0 if new_index >= images.length

    image = images[new_index]

    average =
      image.values.average(:value).to_f.round(2)

    my_value =
      current_user&.values
        &.find_by(image: image)
        &.value

    render json: {
      index: new_index,
      image_id: image.id,
      name: I18n.t("cheeses.#{image.name}"),
      file: image.file,
      average: average,
      my_value: my_value
    }

  end

  def prev_image

    images =
      Image.where(theme_id: params[:theme_id])

    new_index =
      params[:index].to_i - 1

    new_index =
      images.length - 1 if new_index < 0

    image = images[new_index]

    average =
      image.values.average(:value).to_f.round(2)

    my_value =
      current_user&.values
        &.find_by(image: image)
        &.value

    render json: {
      index: new_index,
      image_id: image.id,
      name: I18n.t("cheeses.#{image.name}"),
      file: image.file,
      average: average,
      my_value: my_value
    }

  end

  def rate_image

    image =
      Image.find(params[:image_id])

    value =
      Value.find_or_initialize_by(
        user: current_user,
        image: image
      )

    value.value = params[:value]

    value.save

    average =
      image.values.average(:value).to_f.round(2)

    render json: {
      average: average,
      my_value: value.value
    }

  end

end