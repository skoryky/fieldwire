class Blueprint < ActiveRecord::Base

  belongs_to :floorplan

  validates :floorplan, :presence => true

  mount_uploader :file, FileUploader

  def save_blueprint_to_s3(file)
    save_file_to_s3(filename, file)  # Original file.

    [:large, :thumb].each do |type|
      save_file_to_s3("#{file_name}_#{type}", generate(type, file))
    end
  end

private

  def generate(type, original_file)
    send("generate_#{type}", original_file)
  end

  def generate_large
  end

  def generate_thumb
  end

  def save_file_to_s3(file_name, file)
    # TODO: This assumes that project name and floorplan display_name are immutable.
    s3_key = "#{floorplan.project.name}/#{floorplan.display_name}/#{file_name}"
    object = s3_bucket.objects[s3_key]
    object.write(file)
  end

  def s3_bucket
    return @s3_bucket if @s3_bucket
    bucket = HashWithIndifferentAccess.new(YAML.load_file(Rails.root.join('config', 'aws.yml'))[Rails.env])[:bucket]
    @s3_bucket = AWS::S3.new.buckets[bucket]
  end

end
