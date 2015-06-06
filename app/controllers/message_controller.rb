class MessageController < ApplicationController

  $all_posts = Message.all

  def index
    render json: $all_posts
  end

  def create
    begin
      newmessage = Message.create(text: params.fetch(:text),
                                  name: params.fetch(:name),
                                  room: params.fetch(:room))
      render json: newmessage
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

  def recent_messages
    render json: Message.where(room: params[:room])
                        .select { |posts| posts.created_at > (Time.now - 300) }
  end

  def all_rooms
    current_rooms = []
    $all_posts.group_by { |row| row.room}
    render json: current_rooms
  end


  def create
    begin
      newmessage = Message.create(text: params.fetch(:text),
                                  name: params.fetch(:name),
                                  room: params.fetch(:room))
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
      # make cutoff time take argument
      # cut_off_time = 14400
      $all_posts.each do |row|
        if (Time.new - row.created_at) <= 14400
          recent_user_data << row
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

  def top_ten_users
    top_ten_users = $all_posts.group_by{ |row| row.name }
                             .sort_by{ |key, value| v.count }
                             .reverse.take(10)
                             .map { |post| post.first }

    render json: top_ten_users
  end


  def top_ten_rooms
    top_ten_rooms = $all_posts.group_by{ |row| row.room }
                             .sort_by{ |key, value| value.count }
                             .reverse.take(10)
                             .map { |post| post.first }
    render json: top_ten_rooms
  end

end
