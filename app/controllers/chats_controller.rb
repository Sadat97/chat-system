# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_application
  before_action :set_chat, only: %i[show update destroy]

  # GET /chats
  def index
    @chats = @application.chats.all

    render json: @chats
  end

  # GET /chats/1
  def show
    render json: @chat
  end

  # POST /chats
  def create
    @chat = @application.chats.new(chat_params)

    if @chat.save
      render json: @chat, status: :created, location: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      render json: @chat
    else
      render json: @chat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_chat
    @chat = @application.chats.find_by(chat_number: params[:number])
  end

  def set_application
    @application = Application.find_by(token: params[:application_token])
  end

  # Only allow a trusted parameter "white list" through.
  def chat_params
    params.require(:chat).permit(:application_id)
  end
end
