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
      render json: {error: error.message }, status: 422
    end
  end

  def recent_messages
    render json: Message.where(room: params[:room])
                        .select { |posts| posts.created_at > (Time.now - 300) }
  end

# will work on this later
#   def chat_bot
#     $all_posts.each do |row|
#       if row.text.contains?("chatbot")
#         Message.create(text: "It is #{Time.now}", name: "Chatbot", room: "main")
# end
#   end

  def recent_users
    begin
      recent_user_data = []
      $all_posts.each do |row|
        if (Time.now - row.created_at) <= 14400
          recent_user_data << row
        end
      end
        render json: recent_user_data
      rescue ActionController::ParameterMissing => error
        render json: { error: error.message }, status: 422
      end
    end

  def top_ten_users
    top_users = $all_posts.group_by { |row| row.name }
                              .sort_by { |key, value| value.count}
                              .map{ |row| {name: row.first, count: row.last.count}}
    render json: top_users.reverse.take(10)
  end

  def top_ten_rooms
    top_ten_rooms = $all_posts.group_by{ |row| row.room }
                              .sort_by{ |key, value| value.count }
                              .reverse.take(10)
                              .map { |row| {room: row.first, posts: row.last.count} }
    render json: top_ten_rooms.take(10)
  end

  def all_users
    every_user =
    $all_posts.group_by { |row| row.name}
    .map { |row| row.first }
    render json: every_user
  end

  def profile
    user_profile_data = Message.where(name: params.fetch(:name))
    user_profile_data
    render json: user_profile_data
  end

  # def profile
  #   current_profile =
  #   # params.fetch(:name)
  #   number_of_posts
  #   render json: current_profile
  # end
end
