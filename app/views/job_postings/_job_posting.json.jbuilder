json.extract! job_posting, :id, :_form, :index, :edit, :show, :new, :created_at, :updated_at
json.url job_posting_url(job_posting, format: :json)