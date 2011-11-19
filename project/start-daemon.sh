#!/bin/bash
cd `dirname $0`
exec erl -pa ebin deps/*/ebin -boot start_sasl -config priv/app.config -sname {{name}}srv@`hostname` -cookie {{name}}_cookie -detached -s {{name}}
