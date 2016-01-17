FactoryGirl.define do
  factory :resume do
    firstname "First Name"
    lastname "Last Name"
    email "contact@me.com"
    cv "{
      \"profile\" : {
        \"first_name\" : \"Nurulazrad\",
        \"last_name\": \"Murad\",
        \"email\": \"nurulazrad@gmail.com\",
        \"mobile_no\" : \"0166605507\"
      },
      \"cv\" : {
        \"experiences\" : [
          {
            \"title\" : \"ruby dev\",
            \"company\": \"herbalife products\",
            \"location\": \"kuala lumpur\",
            \"started\" : \"2014\",
            \"ended\" : \"current\",
            \"description\" : \"Develop iChange API for mobile application on Sinatra framework and Weight Loss Challenge application on Rails framework. Codes are tested and verified using RSpec/Cucumber and Capybara. Capistrano is used as a deployment tool in AWS environment. I help manage traffic requests using AWS Autoscaling feature and kept the total cost low.\"
          },
          {
            \"title\" : \"product manager\",
            \"company\": \"primus core\",
            \"location\": \"kuala lumpur\",
            \"started\" : \"2010\",
            \"ended\" : \"2014\",
            \"description\" : \"Responsible to help Primus Core manage application repos using Git. Using Git, managing and trouble- shooting softwares time is minimised significantly. Responsible in managing software development cycle from user requirement, technical documentation, software development and product delivery. Responsible in determining the direction of the softwares being develop in-house.\"
          }
        ],
        \"trainings\" : [
          {
            \"title\" : \"Codeschool\",
            \"location\" : \"Online Training\",
            \"started\" : \"2012\",
            \"ended\" : \"current\",
            \"details\" : \"For more details, please visit my online report card at https://www.codeschool.com/users/20360.\"
          }
        ],
        \"educations\" : [
          {
            \"course\" : \"Chemical Engineering\",
            \"degree\" : \"Bachelor in Chemical Engineering\",
            \"place\" : \"Leeds University\",
            \"graduated_in\" : 1999
          },
          {
            \"course\" : \"1st Year Chemical Engineering\",
            \"degree\" : \"Bachelor in Chemical Engineering\",
            \"place\" : \"Northern Consortium of United Kingdom\",
            \"graduated_in\" : 1997
          }
        ],
        \"portfolios\" : [
          {
            \"title\" : \"iChange for Mobile App\",
            \"details\" : \"When AWS open it's China region, it was lack of features and compared to other regions. So, we have to build the Redis servers using the instances and make it autoscale as needed. MongoDB and Neo4J was never supported, so that has to be built manually on AWS.\"
          },
          {
            \"title\" : \"MYrapid Journey Planner for Google Map\",
            \"details\" : \"The challenge is to be able to port to Google Map Transit system in the future. Responsible in preparing the database schema based on routes, trip and stops provided by MYRapid.\"
          }
        ]
      }
    }"

    trait :invalid do
      email 'invalid.email'
      cv ''
    end
  end

end
