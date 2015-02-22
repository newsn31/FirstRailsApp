class Product < ActiveRecord::Base
has_many :line_items

before_destroy :ensure_not_referenced_by_any_line_item




#validate that the title, description and image_url are not blank.
validates :title, :description, :image_url,  presence: true
#validate that each price is greater than 1 cent.
validates :price, numericality: {greater_than_or_equal_to: 0.01}
#validate that each title is unique
validates :title, uniqueness: true
#validate that the image format is either .gif, .jpg or .png
#used allow_blank to avoid getting multiple errors if image_url field is blank.
validates :image_url, allow_blank: true, format: {
	with: %r{\.(gif|jpg|png)\Z}i, 
	message: 'must be a URL for GIF, JPG or PNG image.'
	}

def self.latest
	Product.order(:updated_at).last
end

	private
	#ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end
end