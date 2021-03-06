# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# test Organization
organizations = Organization.create([{
  name: 'One Brick', 
  address1: '237 Kearney St', 
  address2: '#209', 
  zip: '94108', 
  city: 'San Francisco', 
  email: 'questions@onebrick.org', 
  tax_id: '77-0593889', 
  site_url: 'http://sfbay.onebrick.org/', 
  donation_url: 'http://sfbay.onebrick.org/donate/', 
  description: 'Community Volunteer Opportunities'}])

# test Post
Post.create(
  date: Time.now, 
  title: 'Homeless Dog Gets a Makeover that Saves his Life!',
  message:
    '<p>Charlie the Shelter Dog was found on the side of the road and brought to an L.A. Area Shelter. 
    He was covered in painful burrs. Charlie needed to be adopted quick because the facility was a high kill shelter.</p>
    <p>The Transformation saved his life. After his makeover, he was adopted. 
    There are thousands of other dogs in shelters just like Charlie. Share this video to make a difference.</p>',
  video_url: 'https://www.youtube.com/watch?v=h4xwkl4EQJ4',
  organization: organizations.first)
 