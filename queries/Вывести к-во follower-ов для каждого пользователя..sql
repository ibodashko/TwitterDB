SELECT name,follower_id, COUNT(follower_id) as followers
FROM followers
JOIN users ON users.id=followers.follower_id
group by follower_id;