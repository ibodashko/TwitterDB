select text,date,user from tweets
where user=4
union
select text,date,user from tweets
where user in (select followed_id from followers
where follower_id=4)
order by date desc;