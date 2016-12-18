class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, presence: true
  validates :content, presence: true

  def self.all_ordered_articles
    Article.all.order("created_at DESC")
  end

  def self.articles_of_category(category)
    Article.where(category_id: category.id).order("created_at DESC")
  end
end
