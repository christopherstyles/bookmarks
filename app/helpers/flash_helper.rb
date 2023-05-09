# frozen_string_literal: true

module FlashHelper
  def classes_for_flash(flash_type)
    case flash_type.to_sym
    when :error, :alert
      "bg-red-100 text-red-700"
    else
      "bg-blue-100 text-blue-700"
    end
  end
end
