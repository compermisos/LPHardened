What is LPHardener?
====

Simple, is a "Linux Puppet Hardening Base Code".

Some puppet scripts designed whith the "Security By Default" in mind, the Reusability at premise, and KISS as paradigm.

Ofer a base config, Default Security, Distribution agnostic, to buil Linux Servers for hazarous ambients.

If you are a SysAdmin in very constrained ambient, o DevOps Developer you can easy start devel your production ambient based in this code, and start to build a secure Linux Server

And, if you work as SysAdmin in HigEnd ambient you can easy reuse modules to you ambient.

Is LPHardener Secure?
====

NOT: definitely LPHardener not is a recipe to build a Secure Linux Server, is only scripts to build "more hardened" Base Installs. 

The Computer security (And Security in General) is a continuos proces, based in a polifacetic work.

LPHardener only ofer a "Bootstrap" code to define **YOUR** Linux Server Infraestructure.

What rules are taken in consideration to build LPHardener?
====

The SANS Linux Security CheckList are a basical start point to build a "secure server" and some recomendations are taken.


Install Instructions
====

You can easy clone the Git repo, Fork, or chekout, Make the changes necesaries to adapt to your infraestructure.

Run in puppet *"in your way"* and Enjoy.

Intentionall no exist "detailed" instrucctions to build this project. (p.s. You can view de Rakefile!!!!)


Install Requisites
----

LPHardener Requieres

- Puppet 3.0+
- puppetlabs/firewall )puppet module install puppetlabs/firewall) 
- Linux is mandatory requisite
- And access to package sources to your Distribution are encourage.

What is the current Version
====

The current Version is 0.0.5 Code Name **Slow Motion** and are review work, is a testing grade

And the devel Version (AKA Git Hub master branch) is 1.0.0 Code Name **Anaheli** are planed to "production grade"

Tanks To
====

Bugs?
====

No are knowled bugs, if you find please create issue

Mised Configs?
-----
SELinx is Great tool to hardening Linux, unforunutatily not is a standar componet in some distros, if your force SELinux in miss config distro, SELinux only ofer "miss security" you can view the current discousion in the issue #5,#7 #8

GRSecurity is a great component, only exist one problem, not is standar component, options are considerated you can see the issue #6


