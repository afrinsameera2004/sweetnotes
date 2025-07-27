class Note < ApplicationRecord
  
  has_many_attached :files

 

  after_initialize :set_defaults, if: :new_record?

  def set_defaults
    self.archived = false if self.archived.nil?
  end
 

  validates :title, presence: true
  validates :content, presence: true

  has_many :shared_notes, dependent: :destroy
  has_many :shared_users, through: :shared_notes, source: :user
  
  before_save :normalize_tags

  def tag_array
    tags.to_s.split(',').map(&:strip).reject(&:blank?)
  end

  private

  def normalize_tags
    self.tags = tag_array.uniq.join(', ')
  end
  

  validates :priority, inclusion: { in: ["Low", "Medium", "High"], allow_blank: true }

  belongs_to :user
  scope :active, -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }

end
