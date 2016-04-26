Paperclip::Attachment.default_options[:url] = "/:class/:id/:attachment/:style/:basename.:extension"
Paperclip::Attachment.default_options[:path] = "public/:url"
Paperclip::Attachment.default_options[:old_url] = "/system/:attachment/:id/:style/:basename.:extension"
Paperclip::Attachment.default_options[:old_path] = "/system/:url"

module PaperclipExtension
  def move_images(old_path_pattern = Paperclip::Attachment.default_options[:old_path], new_path_pattern = Paperclip::Attachment.default_options[:path])
    if self.try(:attachment_definitions).present?
      self.all.each do |instance|
        self.attachment_definitions.each do |attachment|
          style_names = (attachment.styles.keys.map(&:to_s) + ["original"]).uniq
          style_names.each do |style_name|
            old_path = interpolate(old_path_pattern, style_name)
            if File.exists?(old_path)
              new_path = interpolate(new_path_pattern, style_name)
              new_dirname = File.dirname(new_path)
              unless File.directory?(new_dirname)
                FileUtils.mkdir_p(new_dirname)
              end

              FileUtils.mv(old_path, new_path)
            end

          end
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, PaperclipExtension)