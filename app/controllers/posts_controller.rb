class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: "aew, post criado."
    else
      render :new, status: :unprocessable_entity
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
      :body,
      :user_id
    )

  end

end
