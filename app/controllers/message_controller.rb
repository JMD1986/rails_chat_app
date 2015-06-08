class MessageController < ApplicationController

  $all_posts = Message.all

  def index
    render json: $all_posts
  end

  #version for multiple rooms
  # def create
  #   begin
  #     newmessage = Message.create(text: params.fetch(:text),
  #                                 name: params.fetch(:name),
  #                                 room: params.fetch(:room))
  #     render json: newmessage
  #   rescue ActionController::ParameterMissing => error
  #     render json: {error: error.message }, status: 422
  #   end
  # end

  #version for only one room
   def create
    begin
      newmessage = Message.create(text: params.fetch(:text),
                                  name: params.fetch(:name),)
      render json: newmessage
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end

  #
  def recent_messages
    begin
      recent_messages = Message.where(room: params[:room])
                               .select {|row| row.created_at > (Time.now - 300) }
      render json: recent_messages
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end

  def recent_users
    begin
      recent_user_data = $all_posts.select { |row| row.created_at > (Time.now - 14400)}
      render json: recent_user_data
    rescue ActionController::ParameterMissing => error
      render json: { error: error.message }, status: 422
    end
  end

  def top_ten_users
    begin
      top_users = $all_posts.group_by { |row| row.name }
                            .sort_by { |key, value| value.count}
                            .map{ |row| {name: row.first, count: row.last.count}}
      render json: top_users.reverse.take(10)
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end

  def top_ten_rooms
    begin
      top_ten_rooms = $all_posts.group_by{ |row| row.room }
                                .sort_by{ |key, value| value.count }
                                .reverse.take(10)
                                .map { |row| {room: row.first, posts: row.last.count} }
      render json: top_ten_rooms.take(10)
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end

  def all_users
    begin
      every_user =
      $all_posts.group_by { |row| row.name}
      .map { |row| row.first }
      render json: every_user
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end

  def profile
    begin
      user_profile_data = Message.where(name: params.fetch(:name))
      user_profile_data
      render json: user_profile_data
    rescue ActionController::ParameterMissing => error
      render json: {error: error.message }, status: 422
    end
  end
end
