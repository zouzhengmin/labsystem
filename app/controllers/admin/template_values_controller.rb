class Admin::TemplateValuesController < Admin::BaseController
  def new
    @temp_value = TemplateValue.new

  end

  def create
  end
end
