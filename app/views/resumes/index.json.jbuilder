json.array!(@resumes) do |resume|
  json.extract! resume, :id, :firstname, :lastname, :email, :cv
  json.url resume_url(resume, format: :json)
end
