class MessageController < ApplicationController
  def index
    render json: Message.all
  end

    def create
      begin
        newmessage = Message.create(text: params.fetch(:text), name: params.fetch(:name))
        render json: newmessage
      rescue ActionController::ParameterMissing => error
        render json: { error: error.message }, status: 422
      end
    end

    def diplay_last_minutes
      begin
        end


end
