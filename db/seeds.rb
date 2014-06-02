# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: "Asteroid Dude")
feed = Feed.create(user_id: user.id)
obs = Observation.create(feed_id: feed.id)
photos = Photo.create([{name: 'p1', path: '468192main_4_closest_approach_946-710.jpg', width: 344, height: 212, observation_id: obs.id}, {name: 'p2', path: 'PIA00136.jpg', width: 344, height: 212, observation_id: obs.id}])

obs2 = Observation.create(feed_id: feed.id)
photos2 = Photo.create([{name: 'p1', path: 'PIA12499_modest.jpg', width: 344, height: 212, observation_id: obs2.id}])

obs3 = Observation.create(feed_id: feed.id)
photos3 = Photo.create([{name: 'p1', path: 'PIA13890_modest.jpg', width: 344, height: 212, observation_id: obs3.id}])

obs3 = Observation.create(feed_id: feed.id)
photos3 = Photo.create([{name: 'p1', path: 'pNuXtut.gif', width: 344, height: 212, observation_id: obs3.id}])

user = User.create(name: "Someone")
feed = Feed.create(user_id: user.id)
obs = Observation.create(feed_id: feed.id)
photos = Photo.create([{name: 'p1', path: '468192main_4_closest_approach_946-710.jpg', width: 344, height: 212, observation_id: obs.id}, {name: 'p2', path: 'PIA00136.jpg', width: 344, height: 212, observation_id: obs.id}])

obs = Observation.create(feed_id: feed.id)
photos = Photo.create({name: 'p1', path: 'ngc891.jpg', width: 344, height: 212, observation_id: obs.id})

obs = Observation.create(feed_id: feed.id)
photos = Photo.create({name: 'p1', path: '6a00d8341bf67c53ef0134802e71b0970c-800wi.jpg', width: 344, height: 212, observation_id: obs.id})

