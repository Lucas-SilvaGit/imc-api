class CalcImcService
  include ActiveModel::Validations
  
  validates :height, :weight, presence: true, numericality: { greater_than: 0}
  
  attr_accessor :height, :weight

  def initialize(height, weight) 
    @height = height
    @weight = weight
  end

  def call
    validate!
    
    calc(height, weight).truncate(2)
  rescue ActiveModel::ValidationError => exception
    exception.message
  end
  
  private

  def calc(height, weight)
    weight / (height * height)
  end
end
