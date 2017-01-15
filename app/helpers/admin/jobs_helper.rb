module Admin::JobsHelper
  def job_status(job)
    if job.is_hidden
      content_tag(:span, '', :class => 'fa fa-lock')
    else
      content_tag(:span, '', :class => 'fa fa-unlock text-success')
    end
  end
  def job_resume_user_count(job)
    s = []
    job.resumes.each do |resume|
      s.push(resume.user)
    end
    return s.uniq.size
  end

end
