class MessageController < ApplicationController

  def index
    current_time = Time.now
    recent_posts = []
    all_posts = Message.all

    all_posts.each do |posts|
      if (current_time - posts.created_at) <= 3000000
        recent_posts << posts
      end
    end
    render json: recent_posts
  end

  def create
    begin
      newmessage = Message.create(text: params.fetch(:text), name: params.fetch(:name))
      render json: newmessage
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

    # A list of users who have posted a message in the last four hours.
    # Bonus points if you can make the four hour window configurable so
    # that it can be easily changed in the future.

  def recent_users
    current_time = Time.now
    recent_posts = []
    recent_posters = []
    all_posts = Message.all
    # make cutoff time take argument
    cut_off_time = 14400
    all_posts.each do |posts|
      if (current_time - posts.created_at) <= cut_off_time
        recent_posts << posts
      end
      # recent_posts.each do |posts|
      #   recent_posters << posts.name
    end
      render json: recent_posts
   end
    # def change_name
    #   Message.where(name: params.fetch(:name)).present?
    # end

    # def recent_users
    #   Message.where(created_at:  )
    # end


end
