class MessageController < ApplicationController

  def index
    current_time = Time.now
    recent_posts = []
    all_posts = Message.all
    last_five_minutes = 300

    all_posts.each do |posts|
      if (current_time - posts.created_at) <= last_five_minutes
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
    begin
      current_time = Time.now
      recent_user_data = []
      all_posts = Message.group(:id, :name)      # make cutoff time take argument
      cut_off_time = 14400
      all_posts.each do |post|
        if (current_time - post.created_at) <= cut_off_time
          recent_user_data << post
        end
      end
        render json: recent_user_data
      rescue ActionController::ParameterMissing => error
        render json: { error: error.message }, status: 422
      end
    end

    # def change_name
    #   Message.where(name: params.fetch(:name)).present?
    # end

  def top_ten
    all_posts = Message.all
  end

end
