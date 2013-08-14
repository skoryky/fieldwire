require 'spec_helper'

describe Project do

  it 'should be invalid without a name' do
    project = Project.new(:name => nil)
    project.should be_invalid
  end

  it 'should be invalid with a too-long name' do
    project = Project.new(:name => 'a' * (Project::MAX_NAME_LENGTH + 1))
    project.should be_invalid
  end

end

