class AddressValidator < ActiveModel::Validator
  def validate(record)
    record.latitude = nil
    record.longitude = nil

    record.geocode

    if(record.latitude == nil || record.longitude == nil)
      record.errors[:base] << "Address can't be located"
    end
  end
end
