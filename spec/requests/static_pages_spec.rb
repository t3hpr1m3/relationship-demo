require 'rails_helper'

describe 'Static Pages' do
  it 'loads up the movies' do
    expect(Movie).to receive(:all).and_call_original
    get '/'
  end
end
