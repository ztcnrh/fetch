-- 1. Look at heavy users avg spend in 2019 Q4


WTIh cte as (
    SELECT
        user_id, sum(dollars) sum_spend
    from receipts
    where receipt_purchase_date between '2019-10-01' and '2019-12-31'
        and item_barcode = 'widget'
    group by user_id
),
trend_a as (
select *
from cte
WHERE sum_spend >
    (SELECT avg(sum_spend)
    FROM cte)
),
trend_b as (
select
    user_id, sum(dollars) sum_spend
    from receipts
    where receipt_purchase_date between '2020-10-01' and '2020-12-31'
        and item_barcode = 'widget'
        and user_id in
        (select distinct user_id
        from trend_a)
    group by user_id
)
select
    a.user_id,
    a.sum_spend as spend_2019,
    b.sum_spend as spend_2020,
    round((b.sum_spend - a.sum_spend)::float / a.sum_spend, 2) as diff
from trend_a a
left join trend_b b
on a.user_id = b.user_id


