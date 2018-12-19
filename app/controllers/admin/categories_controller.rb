class Admin::CategoriesController < Admin::BaseController

  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.roots.paginate(:page => params[:page], :per_page => 20).order("id desc")
    # roots为ancestry中的一级分类
  end

  def new
    @category = Category.new
    # 这行是查出所有的一级分类，共new的表单使用
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "保存成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit
    render :new
  end

  def update
    @category.update(category_params)

    if @category.save
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "删除成功"
      redirect_to admin_categories_path
    else
      flash[:notice] = "删除失败"
      redirect_to :back
    end

  end
  private

  def category_params
    params.require(:category).permit!
  end

  def find_root_categories
    @root_categories = Category.roots.order(id: "desc")
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
