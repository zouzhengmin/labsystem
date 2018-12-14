class TemplateValuesController < ApplicationController
  def new
    @temp_value = TemplateValue.new
  
                # binding.pry
  end

  def create
  end
end
