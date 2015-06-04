class MessageController < ApplicationController
  def index
    render json: Message.all
  end

    def create
    begin
      newmessage = Message.create(text: params.fetch(:text),name: params.feth(:name))
      render json: todolist
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

end
