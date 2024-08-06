require 'rails_helper'

RSpec.describe 'Courses API', type: :request do
  let!(:course) { Course.create(name: 'Math 101', description: 'Basic Mathematics') }
  let!(:tutor) { Tutor.create(name: 'John Doe', email: 'john@example.com', course: course) }

  describe 'POST /courses' do
    let(:valid_attributes) do
      {
        course: {
          name: 'Science 101',
          description: 'Basic Science'
        },
        tutors: [
          { name: 'Jane Doe', email: 'jane@example.com' },
          { name: 'Jim Beam', email: 'jim@example.com' }
        ]
      }
    end

    context 'when the request is valid' do
      it 'creates a course and tutors' do
        post '/courses', params: valid_attributes

        expect(response).to have_http_status(:created)
        expect(json['name']).to eq('Science 101')
        expect(json['tutors'].size).to eq(2)
      end
    end

    context 'when the request is invalid' do
      it 'returns an error' do
        post '/courses', params: { course: { name: '' } }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET /courses' do
    it 'returns all courses with tutors' do
      get '/courses'

      expect(response).to have_http_status(:success)
      expect(json.size).to eq(1)
      expect(json[0]['tutors'].size).to eq(1)
    end
  end

  # Helper method to parse JSON response
  def json
    JSON.parse(response.body)
  end
end