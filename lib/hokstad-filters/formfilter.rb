
# Form-ify various input automatically

class FormFilter < Filter

  def filter line, tag
    line.gsub!("[ ]","<input type='checkbox'/>")
    line.gsub!("[X]","<input type='checkbox' checked='checked' />")
  end
end
