class BrowseFilesUseCase
  attr :path
  def initialize(path)
    @path = path
  end

  def list
    files_list(path)
  end

  def show(id)
    file = File.join(path, id)

    unless File.directory?(file)
      {
        name: File.basename(id),
        path: id,
        type: :file,
        content: File.read(file)
      }
    else
      {
        path: id,
        name: File.basename(id),
        type: :directory,
        files: files_list(file)
      }
    end
  end

  private

  def files_list(dir)
    Dir["#{dir}/*"].map do |file|
      {
        name: File.basename(file),
        path: file.sub("#{path}/", ''),
        isdirectory: File.directory?(file)
      }
    end.sort_by do |item|
      (item[:isdirectory] ? 'a' : 'b') + item[:name]
    end
  end
end
