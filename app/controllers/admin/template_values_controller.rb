class Admin::TemplateValuesController < Admin::BaseController
  def new
    @temp_value = TemplateValue.new

                # binding.pry
  end

  def create
  end
end
