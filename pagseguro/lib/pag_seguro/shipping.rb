module PagSeguro
  class Shipping
    include ActiveModel::Validations
    
    PAC = 1
    SEDEX = 2
    UNIDENTIFIED = 3
    
    validates_format_of :postal_code, with: /^\d{8}$/, message: " must be an integer with 8 digits", allow_blank: true
    
    attr_accessor :type, :state, :city, :postal_code, :district, :street, :number, :complement, :cost
    
    def initialize(attributes = {})
      @type = attributes[:type]
      @state = attributes[:state]
      @city = attributes[:city]
      @postal_code = attributes[:postal_code]
      @district = attributes[:district]
      @street = attributes[:street]
      @number = attributes[:number]
      @complement = attributes[:complement]
      @cost = attributes[:cost]
    end
    
    def postal_code
      @postal_code if @postal_code.present? && @postal_code.to_s.size == 8
    end
    
    def type
      @type.to_i
    end
    
    def pac?
      PAC == type
    end
    
    def sedex?
      SEDEX == type
    end
    
    def unidentified?
      UNIDENTIFIED == type
    end
  end
end