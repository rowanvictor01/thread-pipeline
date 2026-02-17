# Thread Pipeline

An educational project exploring multithreading and concurrent data processing in the Odin programming language.

## Overview

This project implements a three-stage concurrent pipeline where data flows through multiple worker threads. Each stage runs on its own thread, processing and transforming data before passing it to the next stage.

## Key Concepts

- Thread lifecycle management (create, start, join, destroy)
- Producer-consumer pattern
- Thread-safe queues with mutex protection
- Condition variables for synchronization
- Graceful shutdown signaling

## Learning Goals

- Understanding thread coordination and data flow
- Implementing proper synchronization primitives
- Avoiding common concurrency pitfalls (deadlocks, busy-waiting)
