class AddCachingToProtips < ActiveRecord::Migration
  def self.up
    add_column :protips, :cached_votes_total, :integer, :default => 0
    add_column :protips, :cached_votes_score, :integer, :default => 0
    add_column :protips, :cached_votes_up, :integer, :default => 0
    add_index  :protips, :cached_votes_total
    add_index  :protips, :cached_votes_score
    add_index  :protips, :cached_votes_up

    # Uncomment this line to force caching of existing votes
    # Post.find_each(&:update_cached_votes)
  end

  def self.down
    remove_column :protips, :cached_votes_total
    remove_column :protips, :cached_votes_score
    remove_column :protips, :cached_votes_up
  end
end
