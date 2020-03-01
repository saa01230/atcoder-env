#!/usr/bin/env python3
import sys
input = sys.stdin.buffer.readline

def inn(func=int):
    return list(map(func,input().split()))

def ins():
    return input().split()

a = inn()