require 'zipruby'
require 'fileutils'

class Parser

  # Main entry point
  def self.process

  end

  # TODO: Extract into a archive utils module
  # Returns all files for a given set of extentsions in a given directory
  def self.find_reports(dir = compressed_spool_dir, extensions = ['zip'])

    reports = extensions.collect do |ext|
      Dir.glob(File.join(dir, '*.'+ext))
    end

    reports.flatten
  end

  # Extract XML files from an array of ZIP files
  def self.decompress_reports(reports=[], dir = decompressed_spool_dir )

    files = []

    reports.each do |report|
      Zip::Archive.open(report) do |ar|
        ar.each do |zf|
          if zf.directory?
            FileUtils.mkdir_p(zf.name)
          else
            dirname = File.dirname(zf.name)
            FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
            open(zf.name, 'wb') do |f|
              f << zf.read
            end
            files << zf.name
          end
        end
      end
    end

    files
  end

  # Utility Methods
  def self.spool_dir
    File.join(Rails.root, "tmp")
  end

  def self.compressed_spool_dir
    File.join(spool_dir, "compressed")
  end

  def self.decompressed_spool_dir
    File.join(spool_dir, "uncompressed")
  end
end
