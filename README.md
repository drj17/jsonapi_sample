# README

Small test for jsonapi issue reproduction

Users have todos, todos can be awaiting review when there isn't a review from the todos user present.

1. run `rake db:setup`
2. send a request to `http://localhost:8081/todos?filter[awaiting_review_by_user_id]=some_user_id`
