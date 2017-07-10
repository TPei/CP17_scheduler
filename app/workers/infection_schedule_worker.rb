require 'sidekiq'
require 'unirest'
require 'dotenv'
require 'active_support/time'

class InfectionScheduleWorker
  include Sidekiq::Worker

  def perform(game_id, time)
    Unirest.post(
      "#{ENV['MAIN_SERVICE_URL']}/game/infection",
      headers: { "content-type" => "application/json" },
      parameters: { game_id: game_id }.to_json
    )

    InfectionScheduleWorker.perform_in(time.seconds, game_id, time)
  end
end
