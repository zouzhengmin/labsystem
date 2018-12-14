class TemplatesController < ApplicationController

  # before_action :find_templates, only: [:show, :edit, :update, :destroy]

  def history
  end

  def index
    # @templates = Template.all.group_by{|x| x.random}
    # # length = @templates.values[0].length-1
    # @templates.values.each do |temps_of_same_random|
    #   @temps_of_same_random = temps_of_same_random
    #   @temps_of_same_random.each do |temp|
    #     @item_name = temp.item.name
    #   end
    # end
    @temp_names = TemplateName.includes(:templates).order('id desc')
    @item = Item.pluck(:id,:name).to_h
  # binding.pry

    # @fetch_template_id.each do |f|
    #   item_name = Template.find(f).item.name
    # end

    # @templates.each do |t|
    #   @random = t.random
    #
    # end
    # @template = @template.

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
      create_random = ((0..9).to_a + ('a'..'z').to_a).shuffle[0,16].join

      item_ids.to_a.each do |item_id|

        # binding.pry
        @template = Template.create(
                                    :sample_id => params[:sample_id],
                                    :item_id => item_id,
                                    :random =>create_random

                                   )
        @temp_name_mid = TempNameMid.create(
                                            :template_id => @template.id,
                                            :template_name_id => @template_name.id
                                            )
      end

      redirect_to templates_path

    else
      flash[:error] =  "测试模板和测试项目不能为空！"
      redirect_to new_template_path
    end

  end

  def edit
  end

  def update

  end

  def destroy
  end

  private

    def template_params
      params.require(:templates).permit!
    end
    #
    # def sample_params
    #   params.require(:sample).permit!
    # end

end
