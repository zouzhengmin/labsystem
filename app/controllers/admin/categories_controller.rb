class Admin::CategoriesController < Admin::BaseController

  before_action :find_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]

  def index

    if params[:id].blank?
      @categories = Category.roots.paginate(:page => params[:page], :per_page => 20).order("id desc")
    else
      @category = Category.find(params[:id])
      @categories = @category.children.paginate(:page => params[:page], :per_page => 20).order("id desc")
    end
    # roots和children为ancestry中的一级分类
    # index和show页面合并，先判断是否有id，没有的话为一级分类并显示，有id的话为子分类，把子分类展示出来。
  end

  def new
    @category = Category.new
    # 这行是查出所有的一级分类，共new的表单使用
  end

  def create
    # binding.pry
    parent_id = params[:category][:ancestry]
    if parent_id == nil.to_s
      @category = Category.new(category_params)
    else
      @category = Category.find(params[:category][:ancestry].to_i)
      @category = @category.children.new(category_params)
    end

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
      if @category.descendants.any?
        @category.descendants.delete_all
      end
      @category.delete
      flash[:notice] = "删除成功"
      redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
    # 这里permit不加入：ancestry，加入后反而不对。
  end

  def find_categories
    @categories = Category.all.order(id: "desc")
  end

  def find_category
    @category = Category.find(params[:id])
  end
end
