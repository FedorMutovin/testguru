module BadgesHelper
  def badge_header(badge)
    return 'Новый бейдж' if badge.new_record?

    "Редактирование бейджа: #{badge.name}"
  end

  def rules_type_values
    I18n.t(:rules).map { |key, value| [value, key] }
  end
end
