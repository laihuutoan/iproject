class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  # Post.find_each(&:save)

  visitable :ahoy_visit
  acts_as_votable

  include AASM
  include PostSearch

  has_one_attached :feature_image
  has_one_attached :feature_image_mobile
  belongs_to :author, class_name: 'User', foreign_key: :created_by_id, required: false
  has_many :comments

  enum tags: [:popular, :suggestion, :guest]

  # AASM
  aasm column: :state, whiny_transitions: false do
    state :draft
    state :published
  end

  def views
    Ahoy::Event.where(name: 'Viewed post', properties: {'controller': 'posts', 'action': 'show', 'id': self.slug}).count
  end

  def content_toc
    @markdown_toc ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
    @markdown_toc.render(self.content).html_safe
  end

  def content_html
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      quote: true,
      underline: true,
      highlight: true,
      tables: true,
      emoji: true
    }
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true), options)
    @markdown.render(self.content).html_safe
  end
end
