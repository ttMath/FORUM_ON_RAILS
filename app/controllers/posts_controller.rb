class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def show
    @post = Post.find(id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(Post_params)

    if @post.save
      redirect_to @customer, notice: "aew, post criado."
    else
      render :new
    end      
  end

  def edit
    @post = Post.find(id)
  end
  

  def update
    @post = Post.find(id)

    if @post.update(Post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def delete
    @post = Post.find(id)
    @post.destroy
    redirect_to posts_path, notice: 'post deletado com sucesso.'
  end

  private

  def Post_params
    params.require(:post).permit(
      :title,
      :body
    )
    
  end
  
end
