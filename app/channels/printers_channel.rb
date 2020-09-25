class PrintersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "printers_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
