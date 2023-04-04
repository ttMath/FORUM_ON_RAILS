class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  def new

    if user_signed_in?
      @post = Post.new
    else
      redirect_to new_user_registration_path
    end

  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "aew, post criado."
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end


  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def delete
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: 'post deletado com sucesso.'
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body
    )

  end

end
