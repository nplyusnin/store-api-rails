require "rails_helper"

describe JwtToken do
  let(:payload) { { foo: "bar" } }

  let(:token) do
    JWT.encode(
      payload,
      Rails.application.credentials.secret_key_base,
      described_class::ALGORITHM
    )
  end

  describe ".encode" do
    subject { described_class.encode(payload) }

    it { is_expected.to eq(token) }
  end

  describe ".decode" do
    subject { described_class.decode(token).first.symbolize_keys }

    it { is_expected.to eq(payload) }
  end
end
