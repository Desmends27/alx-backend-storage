#!/usr/bin/env python3
""" Writing String to redis """
import uuid
import redis
from typing import List


class Cache:
    """
    _redis: private variable  to save a redis instance
    store: method that generateds a ramdon key 
    """

    def __init__(self) -> None:
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: List[str, bytes, int, float]) -> str:
        """ Stores a data in the database"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
