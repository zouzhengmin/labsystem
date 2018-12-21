class Admin::SamplesController < Admin::BaseController

  before_action :find_sample, only: [:edit, :update, :destroy]

  def index
    @samples = Sample.all.paginate(:page => params[:page], :per_page => 20)
      .order(id: "desc")
  end

  def new
    @sample = Sample.new
    @root_categories = Category.roots
  end

  def create
    binding.pry
    @sample = Sample.new(sample_params)
    if @sample.save
      flash[:notice] = "样品添加成功"
      redirect_to admin_samples_path
    else
      flash[:notice] = "样品添加失败"
      render :new
    end
  end

  def edit
    @root_categories = Category.roots

    render :new
  end

  def update
    @root_categories = Category.roots

    if @sample.update(sample_params)
      flash[:notice] = "修改成功"
      redirect_to admin_samples_path
    else
      render :new
    end
  end

  def destroy
    if @sample.destroy
      flash[:notice] = "删除成功"
      redirect_to admin_samples_path
    else
      flash[:notice] = "修改失败"
      redirect_to :back
    end
  end

  def history
    @samples = Sample.includes(:templates).order('id desc')
    @templates = Template.includes(:template_names)
  end

  private

  def find_sample
    @sample = Sample.find(params[:id])
  end

  def sample_params
    params.require(:sample).permit(:name, :code, :description, :category_id)
  end

end
