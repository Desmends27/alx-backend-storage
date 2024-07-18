#!/usr/bin/env python3
""" Writing String to redis """
import uuid
import redis
from typing import Union, Callable, Optional, Any
from functools import wraps


def count_calls(method: Callable) -> Callable:
    """ Returns the function increments everytime the funcion is called"""
    method_key = method.__qualname__

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        self._redis.incr(method_key)
        return method_key
    return wrapper


class Cache:
    """
    _redis: private variable  to save a redis instance
    store: method that generateds a ramdon key 
    """

    def __init__(self) -> None:
        """ stores an instance of a redis client"""
        self._redis = redis.Redis()
        self._redis.flushdb()
    
    @count_calls
    def store(self, data: Union[int, str, bytes, float]) -> str:
        """ Stores a data in the database"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: Optional[Callable[..., Any]] = None):
        data = self._redis.get(key)
        return fn(data) if fn is not None else data

    def get_str(self, data: str) -> str:
        """ Convert to string"""
        return data.decode('utf-8')

    def get_int(self, data: int) -> int:
        """ Covert to int"""
        return int(data)
