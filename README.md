h1. Rebar Templates

h2. Overview

The fork of useful templates from <code>git@github.com:chaos-ad/rebar-templates.git</code>

Contains the following templates:
* simple rebar project layout
* OTP gen_server callback modules
* OTP application and supervisor callback modules

h2. Notes

If you don't already you can clone this Git repository in your ${HOME}/.rebar/templates directory, i.e.:

<pre>
<code>
 $ git clone git@github.com:chaos-ad/rebar-templates.git ~/.rebar/templates
</code>
</pre>

Alternatively you can add this as a submodule under ${PROJECT_ROOT}/priv/templates if you want to use 
these templates just for a particular project.

h2. Developer(s)

* "Susan Potter":http://twitter.com/SusanPotter

h2. Contributor(s)

* "Ahmed D. Omar":http://twitter.com/spawn_think - bug fix in ejabberdmod template (s/init\/7/init\/2/ in exports).

h2. Examples

If you want to create a new application, you can do the following:

<pre>
<code>
mkdir mysample && cd mysample
wget http://hg.basho.com/rebar/downloads/rebar && chmod u+x rebar
./rebar create template=myproject name=mysample skip_deps=true
./rebar create template=myapp name=mysample description="sample application" skip_deps=true
</code>
</pre>
