namespace :dummy do
  desc "Hydrate the database with some dummy data to make it easier to develop"
  task :reset => :environment do
    # Write some Ruby to quickly create some records in your tables.
    # If it's helpful, you can use methods from the Faker gem for random data:
    #   https://github.com/stympy/faker

  
User.create([
  {id: 10, email: "ellen@example.com", encrypted_password: "password", profile_pic: "https://image.shutterstock.com/mosaic_250/2967241/776697943/stock-photo-pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction-at-776697943.jpg", bio: "Hello, I'm Ellen. I love wine!", taste_profile: "Chardonnay, Pinot Noir", created_at: "2018-10-24 17:24:38"},
  {id: 11, email: "william@example.com", encrypted_password: "password", profile_pic: "https://media.istockphoto.com/photos/happy-laughing-man-picture-id544358212?k=6&m=544358212&s=612x612&w=0&h=odURMNz2hty8LIfpVahaaUKpGU4vd-UlZx4jy-OAnJA=", bio: "Hello, I'm William. I love wine!", taste_profile: "Syrah", created_at: "2019-01-15 09:44:23"},
  {id: 12, email: "bill@example.com", encrypted_password: "password", profile_pic: "https://ak1.picdn.net/shutterstock/videos/7252651/thumb/1.jpg", bio: "Hello, I'm Bill. I love wine!", taste_profile: "Chardonnay, Pinot Grigio", created_at: "2017-08-22 10:14:29"}
])

Wine.create([
  {id: 40, name: "La Crema", varietal: "Chardonnay", price: "14.00", location_of_origin: "Napa Valley, CA", year_of_origin: "2015", image: "https://products1.imgix.drizly.com/ci-la-crema-sonoma-coast-chardonnay-fbc9fd94b43f13ed.jpeg?auto=format%2Ccompress&fm=jpeg&q=20", created_at: "2016-07-12 11:17:20"},
  {id: 41, name: "Rombauer", varietal: "Chardonnay", price: "49.00", location_of_origin: "Napa Valley, CA", year_of_origin: "2018", image: "https://dydza6t6xitx6.cloudfront.net/ci-rombauer-chardonnay-3199313d213a97fd.jpeg", created_at: "2017-09-10 08:20:22"},
  {id: 42, name: "Sequoia Grove", varietal: "Cabernet Sauvignon", price: "42.00", location_of_origin: "Napa Valley, CA", year_of_origin: "2015", image: "https://www.sequoiagrove.com/assets/images/wines/originals/11SGV_CS-NV16.png", created_at: "2017-02-22 12:13:33"},
  {id: 43, name: "Joel Gott", varietal: "Sauvignon Blanc", price: "15.00", location_of_origin: "Sonoma, CA", year_of_origin: "2017", image: "https://www.totalwine.com/media/sys_master/twmmedia/hf1/h7f/11785458581534.png", created_at: "2018-07-16 02:34:45"},
  {id: 44, name: "Tiefenbrunner", varietal: "Pinot Grigio", price: "16.00", location_of_origin: "Trentino-Alto Adige, Italy", year_of_origin: "2017", image: "https://www.firstchoiceliquor.com.au/-/media/images/products/generic_winebottle.ashx?bc=white&mh=470&w=140&productID=1997905&isThumbnail=False&hash=EF05BB9E64D6CD6A541B795322E711C8F9251F4D", created_at: "2017-09-10 08:20:22"},
  {id: 45, name: "Big Table Farm", varietal: "Pinot Noir", price: "45.00", location_of_origin: "Willamette Valley, OR", year_of_origin: "2016", image: "https://www.klwines.com//images/skus/1301806x.jpg", created_at: "2018-09-10 23:20:22"},
  {id: 46, name: "Beringer", varietal: "Cabernet Sauvignon", price: "36.00", location_of_origin: "Knights Valley, CA", year_of_origin: "2015", image: "https://www.totalwine.com/media/sys_master/twmmedia/he8/h7f/8809490448414.png", created_at: "2019-02-10 07:44:03"},
  {id: 47, name: "Loring", varietal: "Pinot Noir", price: "38.00", location_of_origin: "Santa Barbara, CA", year_of_origin: "2016", image: "http://ftp.loringwinecompany.com/downloads/files/bottle_2017_pinot_clos_pepe_750ml.jpg", created_at: "2018-11-27 08:46:02"}
])

Rating.create([
  {id: 30, wine_id: 40, user_id: 10, score: 4.5, comment: "This is the best wine I've ever had!", created_at: "2019-02-10 07:44:03"},
  {id: 31, wine_id: 40, user_id: 11, score: 4.5, comment: "Agree! So fluid and delicious. Great with fish.", created_at: "2019-04-10Re 07:44:03"},
  {id: 32, wine_id: 42, user_id: 11, score: 4.0, comment: "Very satisfied, highly recommend!", created_at: "2019-06-12 03:59:11"},
  {id: 33, wine_id: 44, user_id: 11, score: 3.5, comment: "Good, not great - a reliable option.", created_at: "2019-02-10 07:44:03"},
  {id: 34, wine_id: 45, user_id: 12, score: 3.0, comment: "Solid match for a pasta meal, but not special.", created_at: "2018-12-09 03:33:25"}
  ])

Varietal.create([
  {id: 50, grape: "Chardonnay", created_at: "2019-02-10 07:44:03"},
  {id: 51, grape: "Pinot Noir", created_at: "2018-01-10 07:22:33"},
  {id: 52, grape: "Pinot Grigio", created_at: "2019-03-12 08:34:33"},
  {id: 53, grape: "Syrah", created_at: "2019-02-15 10:34:12"},
  {id: 54, grape: "Cabernet Sauvignon", created_at: "2019-12-15 07:32:23"},
  {id: 55, grape: "Petit Syrah", created_at: "2017-04-21 03:01:52"},
  {id: 56, grape: "Bordeaux", created_at: "2019-06-16 03:02:24"},
  {id: 57, grape: "Sauvignon Blanc", created_at: "2018-07-15 05:33:36"},
  {id: 58, grape: "Zinfandel", created_at: "2019-08-13 07:23:38"},
  {id: 59, grape: "Riesling", created_at: "2018-08-26 12:12:52"},
  {id: 60, grape: "Merlot", created_at: "2019-09-16 14:43:23"},
  {id: 61, grape: "Rose", created_at: "2018-10-15 23:42:46"},
  {id: 62, grape: "Champagne", created_at: "2019-11-12 13:13:24"},
  ])
  end
end
