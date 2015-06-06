class MessageController < ApplicationController



  def main
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

  def all_rooms
    all_posts = Message.all
    current_rooms = []
    all_posts.group_by { |row| row.room}
    render json: current_rooms
  end

  def top_ten_rooms
    all_posts = Message.all
    top_ten_rooms = all_posts.group_by{ |posts| row.room }
                             .sort_by{ |key, value| value.count }
                             .reverse.take(10)
                             .map { |post| post.first }
  end

  def create
    begin
      newmessage = Message.create(text: params.fetch(:text), name: params.fetch(:name), room: params.fetch(:room))
      render json: newmessage
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end



  def createsalad
    begin
      newmessage = Message.create(text: params.fetch(:text), name: params.fetch(:name), room: "Salad")
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
      all_posts = Message.all      # make cutoff time take argument
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
    top_ten_users = all_posts.group_by{ |row| row.name }
                             .sort_by{ |k,v| v.count }
                             .reverse.take(10)
                             .map { |post| post.first }

    render json: top_ten_users
  end

end
