class Api::V1::AudioController < ApiController
  def show
    data = {fact: Faker::ChuckNorris.fact}
    render :json => data, status: 200
  end
end
