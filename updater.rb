require 'fileutils'

class Updater
  def initialize(src_dir, targets, dst_dir)
    # src_dir + targets
    # __dir__ + dst_dir
    @src_dir = src_dir
    @targets = targets
    @dst_dir = dst_dir
  end

  def run
    Dir.chdir(__dir__) do
      unless File.exist?(@src_dir)
        STDERR.puts 'zprezto files not found...'
        exit 1
      end

      unless File.exist?(@dst_dir)
        puts "INFO: Create ./#{@dst_dir}"
        Dir.mkdir("./#{@dst_dir}")
      end

      unless File.directory?(@dst_dir)
        STDERR.puts "#{@dst_dir} is not a directory."
        exit 1
      end

      @targets.each do |e|
        src = "#{@src_dir}#{e}"
        dst = "#{@dst_dir}/#{e}"
        unless File.exist?(src)
          puts "WARNING: #{e} does not exist at #{@src_dir}"
          next
        end
        if File.exist?(dst)
          puts "INFO: #{dst} will be overwritten..."
          FileUtils.rm(dst)
        end
        FileUtils.cp(src, dst)
      end
    end
  end
end
