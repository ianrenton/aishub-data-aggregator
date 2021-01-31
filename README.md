# AIS Hub Data Aggregator

[AIS Hub](https://www.aishub.net/) provides a nice [API](https://www.aishub.net/api) for retrieving its current global data set in a variety of formats, for free if you contribute with your own AIS receiver. Unfortunately, it only maintains a history of the last 30 minutes, so any vessels that have not been received within that time period will not be reported. This data is available from other sources such as MarineTraffic or VesselFinder, but at significant cost.

This script polls the AIS Hub API for its complete data set, and stores it locally in CSV format. When it is next run, it *aggregates* the new data into the old, so the resulting file contains the last known data, even for vessels that have stopped being received. Over multiple runs, the aggregate data set is built up to include the (probable) location of a larger number of vessels than would be returned by a single API call.

The script is intended to be run as a cron job at 30 minute intervals.

You must supply your own AIS Hub API username to use this script, so it is only useful for people who are able to run their own AIS receiver and feed the data to AIS Hub, as that is a requirement of membership.
