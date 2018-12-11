class TemplatesController < ApplicationController

  # before_action :find_templates, only: [:show, :edit, :update, :destroy]

  def history
  end

  def index
    @samples = Sample.includes(:items)
    # @template_name = TemplateName.all
    # @template = Template.all
  end

  def show
  end

  def new
    @template = Template.new
  end

  def create

    if params[:item].present? && params[:template_name][:name].present?
      @template_name = TemplateName.create(
                                          :name => params[:template_name][:name]
                                          )
      item_ids = params[:item].keys
      item_ids.to_a.each do |item_id|
        @template = Template.create(:sample_id => params[:sample_id],
                                    :item_id => item_id
                                   )
        @temp_name_mid = TempNameMid.create(
                                            :template_id => @template.id,
                                            :template_name_id => @template_name.id
                                            )
      end

      redirect_to templates_path

    else
      render :new # flash: "测试模板和测试项目不能为空！"
    end

  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

    # def find_templates
    #   @templates = Template.find(params[:id])
    # end
    #
    # def sample_params
    #   params.require(:sample).permit!
    # end

end
