require 'spec_helper'
require 'zipruby'

describe Parser do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @parser = Parser.new
  end

  it "should find all .zip files in a directory" do
    # Setup
    num_files = Random.rand(1..9)
    tmpdir = Dir.mktmpdir
    tmpfiles = (1..num_files).collect{|i| Tempfile.new([i.to_s, '.zip'], tmpdir)}

    # Test
    Parser.find_reports(tmpdir).length.should == num_files

    # Cleanup
    FileUtils.remove_entry_secure tmpdir
  end

  it "should extract all files contained in an array of zip files" do
    # Setup
    num_files = Random.rand(1..9)
    tmpdir = Dir.mktmpdir
    tmpfiles = (1..num_files).collect{|i| Tempfile.new([i.to_s, ".xml"], tmpdir)}


  end


end
