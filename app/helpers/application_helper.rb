module ApplicationHelper
  def save_button_text(model)
    model.new_record? ? 'Create' : 'Save'
  end
end
