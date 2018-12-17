class TemplatesController < ApplicationController

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

    if params[:item].present? && params[:template_name][:name].present? && params[:value].values.present?
      @template_name = TemplateName.create(
                                          :name => params[:template_name][:name]
                                          )

      create_random = ((0..9).to_a + ('a'..'z').to_a).shuffle[0,16].join
      # binding.pry
      item_ids = params[:item].keys
      values = params[:value].values
      join_item_ids_values = (item_ids.zip values).to_h

      join_item_ids_values.each do |item_id, value|
      @template = Template.create(
                                  :sample_id => params[:sample_id],
                                  :item_id => item_id,
                                  :random => create_random,
                                  :value => value
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



end
