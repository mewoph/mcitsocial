class AddCachingToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :cached_votes_total, :integer, :default => 0
    add_column :comments, :cached_votes_score, :integer, :default => 0
    add_column :comments, :cached_votes_up, :integer, :default => 0
    add_index  :comments, :cached_votes_total
    add_index  :comments, :cached_votes_score
    add_index  :comments, :cached_votes_up

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :comments, :cached_votes_total
    remove_column :comments, :cached_votes_score
    remove_column :comments, :cached_votes_up
  end
end
