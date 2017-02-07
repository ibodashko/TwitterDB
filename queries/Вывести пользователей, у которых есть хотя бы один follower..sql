SELECT name FROM users
join followers on users.id=followers.follower_id
group by name;