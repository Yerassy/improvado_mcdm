{{ config(materialized="table") }}

select
    channel,
    round(sum(spend) / sum(engagements), 2) as cost_per_engage,
    round(sum(0), 2) as conversion_cost,
    round(sum(impressions), 2) as impressions,
    round(sum(spend) / sum(clicks), 2) as crc
from `bingdata.twit_data`
group by channel

union all

select
    channel,
    round(sum(0), 2) as cost_per_engage,
    round(sum(spend) / sum(conv), 2) as conversion_cost,
    round(sum(imps), 2) as impressions,
    round(sum(spend) / sum(clicks), 2) as crc
from `bingdata.bing`
group by channel

union all
select
    channel,
    round(sum(spend) / sum(views), 2) as cost_per_engage,
    round(sum(spend) / sum(purchase), 2) as conversion_cost,
    round(sum(impressions), 2) as impressions,
    round(sum(spend) / sum(clicks), 2) as crc
from `bingdata.facebook_data`
group by channel

union all
select
    channel,
    round(sum(spend) / sum(video_views), 2) as cost_per_engage,
    round(sum(spend) / sum(conversions), 2) as conversion_cost,
    round(sum(impressions), 2) as impressions,
    round(sum(spend) / sum(clicks), 2) as crc
from `bingdata.tiktok_data`
group by channel
