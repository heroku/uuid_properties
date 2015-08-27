require "uuid_properties/version"
require "securerandom"

module UuidProperties
  UUID_PATTERN =
    /\A[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[89ab][a-f0-9]{3}-[a-f0-9]{12}\Z/

  def self.included(klass)
    klass.extend(ClassMethods)
    klass.before_validation :generate_uuid
    klass.validates_presence_of :uuid
  end

  # The underlying Postgres tables themselves will generate UUIDs by default,
  # but ActiveRecord in general doesn't play nicely with default databases
  # values so we set UUIDs in our models first.
  def generate_uuid
    self.uuid ||= SecureRandom.uuid
  end

  module ClassMethods
    # Postgres will blow up when a UUID type is compared to a string, so
    # sanitize our input first. This also makes sense as a performance
    # optimization -- if the input isn't a UUID anyway, it doesn't make any
    # sense to go to the database.
    def find_by_uuid(uuid, options={})
      if uuid =~ UuidProperties::UUID_PATTERN
        # copy merge in case of incoming frozen hash
        options = options.merge(:conditions => ["#{table_name}.uuid = ?", uuid])
        record = self.find(:first, options)
        record
      else
        nil
      end
    end

    def find_by_uuid!(uuid, options={})
      unless uuid =~ UuidProperties::UUID_PATTERN
        raise ArgumentError, "Improperly formatted UUID."
      end
      # copy merge in case of incoming frozen hash
      options = options.merge(:conditions => ["#{table_name}.uuid = ?", uuid])
      record = self.find(:first, options)
      record || raise(ActiveRecord::RecordNotFound)
    end
  end
end
