module GradeDistributionCacher
  def self.recache_grade_distributions
    Course.find_ids_in_batches do |ids|
      Course.scoped(:select => 'id', :conditions => {:id => ids}).each do |course|
        course.recache_grade_distribution_without_send_later
      end
    end
  end
end