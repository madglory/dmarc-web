require 'zipruby'
require 'fileutils'

module ParserUtils
  # TODO: Extract into a archive utils module
  # Returns all files for a given set of extentsions in a given directory
  def find_files(dir = compressed_spool_dir, extensions = ['zip'])

    files = extensions.collect do |ext|
      Dir.glob(File.join(dir, '*.'+ext))
    end

    files.flatten
  end

  # Extract XML files from an array of ZIP files
  def decompress_files(compressed_files=[], dir = decompressed_spool_dir )

    files = []

    compressed_files.each do |file|
      Zip::Archive.open(file) do |ar|
        ar.each do |zf|
          if zf.directory?
            FileUtils.mkdir_p(zf.name)
          else
            dirname = File.dirname(zf.name)
            FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
            output_file = File.join(dir, zf.name)
            open(output_file, 'wb') do |f|
              f << zf.read
            end
            files << output_file
          end
        end
      end
      # TODO: Delete processed file
    end

    files
  end

  # Utility Methods
  def spool_dir
    File.join(Rails.root, "tmp/spool")
  end

  def compressed_spool_dir
    File.join(spool_dir, "compressed")
  end

  def decompressed_spool_dir
    File.join(spool_dir, "decompressed")
  end

end
