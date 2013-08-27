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
      { name: id,
	type: 'file',
	content: File.read(file) }
    else
      { name: id,
	type: 'directory',
	files: files_list(file) }
    end
  end

  private

  def files_list(dir)
    Dir["#{dir}/*"].map do |file|
      {name: file.sub("#{path}/", ''), isdirectory: File.directory?(file)}
    end.sort_by do |i|
      (i[:isdirectory] ? 'a' : 'b') + i[:name]
    end
  end
end
