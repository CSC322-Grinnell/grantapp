require_relative '../../rails_helper.rb'
require_relative '../../spec_helper.rb'

RSpec.describe User do
    describe "#signin" do
        before do
            @user = User.new(first_name: "Joe", last_name: "Shmoe")
            puts(@user.id)
        end

        describe "user info" do
            it "verifies the user setup" do
                expect(@user).to be_an_instance_of User
                expect(@user.first_name).to eql("Joe")
                expect(@user.last_name).to eql("Shmoe")
            end
        end
        
        describe "relationships" do
            it { should have_many(:apps) }
        end
    end


end
