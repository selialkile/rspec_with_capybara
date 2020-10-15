# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Testing, type: :model do

  it 'validating' do
    expect(described_class.new.pah).to eq true
  end
end
