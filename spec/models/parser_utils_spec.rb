require 'spec_helper'
require 'zipruby'

describe ParserUtils do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @parser = Object.new
    @parser.extend ParserUtils
  end

  it "should find all .zip files in a directory" do
    # Setup
    num_files = Random.rand(1..9)
    tmpdir = Dir.mktmpdir
    tmpfiles = (1..num_files).collect{|i| Tempfile.new([i.to_s, '.zip'], tmpdir)}

    # Test
    Parser.find_files(tmpdir).length.should == num_files

    # Delete the tmpdir containting all the files
    FileUtils.remove_entry_secure tmpdir
  end

  it "should extract all files contained in an array of zip files" do
    # Setup
    num_files = Random.rand(1..3)
    tmpdir = Dir.mktmpdir

    # Create some temp files
    xmlfiles = (1..num_files).collect{|i| Tempfile.new([i.to_s, ".xml"], tmpdir)}

    # Grab some unused zip file names
    zipfiles = (1..num_files).collect{|i| Tempfile.new([i.to_s, ".zip"], tmpdir)}
    zipfiles.collect!{|file| path = file.path; file.unlink; path}

    # Create a series of zipfiles
    zipfiles.each do |zipfile|
      Zip::Archive.open(zipfile, Zip::BEST_SPEED) do |ar|
        xmlfiles.each do |file|
          ar.add_file(file.path) # add file to zip archive
        end
      end
    end

    # Test
    Parser.decompress_files(zipfiles, tmpdir).length == num_files * num_files

    # Delete the tmpdir containting all the files
    FileUtils.remove_entry_secure tmpdir
  end


end
