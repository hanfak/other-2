class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, presence: true, uniqueness: {case_sensitive: false}
  validates :content, presence: true

  def self.all_ordered_articles
    Article.all.order("created_at DESC")
  end

  def self.articles_of_category(category)
    Article.where(category_id: category.id).order("created_at DESC")
  end

  def to_param
    title
  end
end
