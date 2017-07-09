class TagsController < ApplicationController
  def show
    @tag = Tag.find_by id: params[:id]
    load_info @tag
  end
end
