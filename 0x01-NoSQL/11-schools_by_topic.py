#!/usr/bin/env python3
""" Returns the list of school having a specific topic """


def schools_by_topic(mongo_collection, topic):
    """ Functions tha returns the list of school having a topic"""
    return mongo_collection.find({"topics": topic})
