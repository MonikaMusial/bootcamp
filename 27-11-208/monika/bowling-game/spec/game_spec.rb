require 'spec_helper'
require_relative '../game'

RSpec.describe Game do
  it 'returns correct scoring value when there was no rolls' do
    expect(subject.scoring).to eq(0)
  end
end