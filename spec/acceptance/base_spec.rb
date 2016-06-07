require 'spec_helper_acceptance'
require_relative './version.rb'

describe 'timezone class' do

  context 'basic setup' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOF

      class { 'timezone':
        region   => 'Europe',
        locality => 'Andorra',
      }

      EOF

      # Run it twice and test for idempotency
      expect(apply_manifest(pp).exit_code).to_not eq(1)
      expect(apply_manifest(pp).exit_code).to eq(0)
    end

    describe package($packagename) do
      it { is_expected.to be_installed }
    end

    it "check default TZ" do
      expect(shell("bash -c 'date +%Z | grep -E 'CES?T''").exit_code).to be_zero
    end

  end
end
