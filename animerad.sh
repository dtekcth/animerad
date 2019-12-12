#!/bin/bash
SHOWS=$(trackma ls | grep results | head -c1)

echo $SHOWS
