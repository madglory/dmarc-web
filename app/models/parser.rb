require 'zipruby'
require 'fileutils'
class Parser

  # Returns all files for a given set of extentsions in a given directory
  def self.find_reports(dir = spool_dir, extensions = ['zip'])

    reports = extensions.collect do |ext|
      Dir.glob(File.join(dir, '*.'+ext))
    end

    reports.flatten
  end

  # Extract XML files from an array of ZIP files
  def self.unarchive_reports(reports=[])

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

  def self.process

  end

  protected

  def self.spool_dir
    File.join(Rails.root, "tmp")
  end

end
